import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/signalr_service.dart';
import '../../../dashboard/data/device_repository.dart';
import '../../../../shared/models/device.dart';
import '../../../../shared/models/metric.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  StreamSubscription<Metric>? _metricsSubscription;

  @override
  Future<List<Device>> build() async {
    // 1. Загружаем начальный список устройств
    final devices = await ref.read(deviceRepositoryProvider).getDevices();

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
  }

  void _listenToMetrics() {
    final signalR = ref.read(signalRServiceProvider);
    _metricsSubscription?.cancel();

    _metricsSubscription = signalR.metricsStream.listen((metric) {
      final currentDevices = state.value;
      if (currentDevices == null) return;

      // Глубокое копирование и обновление значения сенсора
      final updatedDevices = currentDevices.map((device) {
        // Проверяем, есть ли у этого устройства нужный сенсор
        final hasSensor = device.sensors.any((s) => s.sensorId == metric.sensorId);
        
        if (!hasSensor) return device;

        // Обновляем список сенсоров устройства
        final updatedSensors = device.sensors.map((sensor) {
          if (sensor.sensorId == metric.sensorId) {
            return sensor.copyWith(currentValue: metric.value);
          }
          return sensor;
        }).toList();

        return device.copyWith(sensors: updatedSensors);
      }).toList();

      // Обновляем состояние без мутаций
      state = AsyncData(updatedDevices);
    });
  }
}
