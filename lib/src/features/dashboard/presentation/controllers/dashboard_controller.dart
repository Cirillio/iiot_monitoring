import 'dart:async';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/signalr_service.dart';
import '../../../dashboard/data/device_repository.dart';
import '../../../../shared/models/device.dart';
import '../../../../shared/models/metric.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  StreamSubscription<Metric>? _metricsSubscription;
  final _logger = Logger("DashboardController");

  @override
  Future<List<Device>> build() async {
    try {
      // 1. Загружаем начальный список устройств с таймаутом
      final devices = await ref
          .read(deviceRepositoryProvider)
          .getDevices(4)
          .timeout(const Duration(seconds: 10));

      // 2. Запускаем SignalR
      final signalR = ref.read(signalRServiceProvider);
      unawaited(signalR.start());

      // 3. Подписываемся на обновления метрик
      _listenToMetrics();

      // Гарантируем отписку при уничтожении контроллера
      ref.onDispose(() {
        _metricsSubscription?.cancel();
      });

      return devices;
    } on TimeoutException {
      throw 'Не удалось загрузить данные об устройствах, проверьте подключение или попробуйте снова';
    } catch (e) {
      _logger.severe('Dashboard load error: $e');
      rethrow;
    }
  }

  void _listenToMetrics() {
    final signalR = ref.read(signalRServiceProvider);
    _metricsSubscription?.cancel();

    _metricsSubscription = signalR.metricsStream.listen((metric) {
      final currentDevices = state.value;
      if (currentDevices == null || currentDevices.isEmpty) return;

      bool anyUpdated = false;

      final updatedDevices = currentDevices.map((device) {
        // Проверяем наличие сенсора в устройстве
        final hasSensor = device.sensors.any(
          (s) => s.sensorId == metric.sensorId,
        );
        if (!hasSensor) return device;

        anyUpdated = true;
        _logger.fine(
          'Updating sensor ${metric.sensorId} with value ${metric.value} | Device: ${device.id} | Sensor icon: ${device.sensors.firstWhere((s) => s.sensorId == metric.sensorId).uiConfigJson?.icon}',
        );

        final updatedSensors = device.sensors.map((sensor) {
          if (sensor.sensorId == metric.sensorId) {
            return sensor.copyWith(
              currentValue: metric.value,
              lastSensorUpdated: metric.time,
            );
          }
          return sensor;
        }).toList();

        return device.copyWith(sensors: updatedSensors);
      }).toList();

      if (anyUpdated) {
        state = AsyncData(updatedDevices);
      }
    });
  }
}
