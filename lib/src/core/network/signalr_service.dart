import 'dart:async';
import 'dart:convert';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:signalr_netcore/signalr_client.dart';

import '../../shared/models/metric.dart';
import 'api_client.dart';

part 'signalr_service.g.dart';

class SignalRService {
  final String _baseUrl;
  late HubConnection _hubConnection;
  final _metricsController = StreamController<Metric>.broadcast();
  final _logger = Logger('SignalRService');

  SignalRService(this._baseUrl) {
    _hubConnection = HubConnectionBuilder()
        .withUrl('$_baseUrl/hubs/metrics')
        .withAutomaticReconnect()
        .build();

    _hubConnection.onclose(({error}) {
      _logger.warning('SignalR connection closed: $error');
    });

    _hubConnection.onreconnecting(({error}) {
      _logger.info('SignalR reconnecting: $error');
    });

    _hubConnection.onreconnected(({connectionId}) {
      _logger.info('SignalR reconnected: $connectionId');
    });

    _hubConnection.on('ReceiveMetrics', _handleReceiveMetrics);
  }

  void _handleReceiveMetrics(List<Object?>? arguments) {
    if (arguments == null || arguments.isEmpty) {
      _logger.warning('ReceiveMetrics received with empty arguments');
      return;
    }

    try {
      final jsonString = arguments[0] as String;
      _logger.fine('Raw metric received: $jsonString');
      final metric = Metric.fromJson(jsonDecode(jsonString));
      _metricsController.add(metric);
    } catch (e, stack) {
      _logger.severe('Error parsing ReceiveMetrics data: $e', e, stack);
    }
  }

  Future<void> start() async {
    _logger.info(
      'Attempting to start SignalR connection. Current state: ${_hubConnection.state}',
    );

    if (_hubConnection.state == HubConnectionState.Connected) {
      _logger.info('SignalR connection already connected');
      return;
    }

    try {
      _logger.info('Starting SignalR connection...');
      await _hubConnection.start();
      _logger.info('SignalR connection started successfully');
    } catch (e, stack) {
      _logger.severe('Error starting SignalR connection: $e', e, stack);
      // Повторная попытка через 5 секунд в случае неудачи при старте
      Future.delayed(const Duration(seconds: 5), start);
    }
  }

  Stream<Metric> get metricsStream => _metricsController.stream;

  void dispose() {
    _hubConnection.stop();
    _metricsController.close();
  }
}

@Riverpod(keepAlive: true)
SignalRService signalRService(Ref ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final service = SignalRService(baseUrl);

  ref.onDispose(() {
    service.dispose();
  });

  return service;
}
