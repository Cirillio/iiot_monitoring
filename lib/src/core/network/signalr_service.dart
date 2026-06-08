import 'dart:async';
import 'dart:convert';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:signalr_netcore/signalr_client.dart';

import '../../shared/models/metric.dart';
import '../../shared/models/system/command_status_event.dart';
import 'api_client.dart';

part 'signalr_service.g.dart';

class SignalRService {
  final String _baseUrl;
  late HubConnection _metricsHub;
  late HubConnection _controlHub;
  
  final _metricsController = StreamController<Metric>.broadcast();
  final _commandStatusController = StreamController<CommandStatusEvent>.broadcast();
  final _configUpdatedController = StreamController<Map<String, dynamic>>.broadcast();
  final _systemAlertController = StreamController<Map<String, dynamic>>.broadcast();

  final _logger = Logger('SignalRService');

  SignalRService(this._baseUrl) {
    _initMetricsHub();
    _initControlHub();
  }

  void _initMetricsHub() {
    _metricsHub = HubConnectionBuilder()
        .withUrl('$_baseUrl/hubs/metrics')
        .withAutomaticReconnect()
        .build();

    _metricsHub.onclose(({error}) => _logger.warning('MetricsHub closed: $error'));
    _metricsHub.onreconnecting(({error}) => _logger.info('MetricsHub reconnecting: $error'));
    _metricsHub.onreconnected(({connectionId}) => _logger.info('MetricsHub reconnected: $connectionId'));

    _metricsHub.on('ReceiveMetrics', _handleReceiveMetrics);
    _metricsHub.on('ConfigUpdated', _handleConfigUpdated);
    _metricsHub.on('SystemAlert', _handleSystemAlert);
  }

  void _initControlHub() {
    _controlHub = HubConnectionBuilder()
        .withUrl('$_baseUrl/hubs/control')
        .withAutomaticReconnect()
        .build();

    _controlHub.onclose(({error}) => _logger.warning('ControlHub closed: $error'));
    _controlHub.onreconnecting(({error}) => _logger.info('ControlHub reconnecting: $error'));
    _controlHub.onreconnected(({connectionId}) => _logger.info('ControlHub reconnected: $connectionId'));

    _controlHub.on('CommandStatusChanged', _handleCommandStatusChanged);
  }

  void _handleReceiveMetrics(List<Object?>? arguments) {
    if (arguments == null || arguments.isEmpty) return;
    try {
      final jsonString = arguments[0] as String;
      final metric = Metric.fromJson(jsonDecode(jsonString));
      _metricsController.add(metric);
    } catch (e, stack) {
      _logger.severe('Error parsing ReceiveMetrics: $e', e, stack);
    }
  }

  void _handleConfigUpdated(List<Object?>? arguments) {
    if (arguments == null || arguments.length < 2) return;
    try {
      _logger.info('ConfigUpdated received: $arguments');
      _configUpdatedController.add({
        'entityType': arguments[0],
        'entityId': arguments[1]
      });
    } catch (e, stack) {
      _logger.severe('Error parsing ConfigUpdated: $e', e, stack);
    }
  }

  void _handleSystemAlert(List<Object?>? arguments) {
    if (arguments == null || arguments.length < 2) return;
    try {
      _logger.info('SystemAlert received: $arguments');
      _systemAlertController.add({
        'message': arguments[0],
        'level': arguments[1]
      });
    } catch (e, stack) {
      _logger.severe('Error parsing SystemAlert: $e', e, stack);
    }
  }

  void _handleCommandStatusChanged(List<Object?>? arguments) {
    if (arguments == null || arguments.isEmpty) return;
    try {
      final jsonString = arguments[0] as String;
      final event = CommandStatusEvent.fromJson(jsonDecode(jsonString));
      _commandStatusController.add(event);
    } catch (e, stack) {
      _logger.severe('Error parsing CommandStatusChanged: $e', e, stack);
    }
  }

  Future<void> start() async {
    try {
      if (_metricsHub.state == HubConnectionState.Disconnected) {
        await _metricsHub.start();
        _logger.info('MetricsHub started');
      }
      if (_controlHub.state == HubConnectionState.Disconnected) {
        await _controlHub.start();
        _logger.info('ControlHub started');
      }
    } catch (e, stack) {
      _logger.severe('Error starting hubs: $e', e, stack);
      Future.delayed(const Duration(seconds: 5), start);
    }
  }

  Stream<Metric> get metricsStream => _metricsController.stream;
  Stream<CommandStatusEvent> get commandStatusStream => _commandStatusController.stream;
  Stream<Map<String, dynamic>> get configUpdatedStream => _configUpdatedController.stream;
  Stream<Map<String, dynamic>> get systemAlertStream => _systemAlertController.stream;

  void dispose() {
    _metricsHub.stop();
    _controlHub.stop();
    _metricsController.close();
    _commandStatusController.close();
    _configUpdatedController.close();
    _systemAlertController.close();
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
