import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/calculated_device.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/calculated_sensor.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/device_summary.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/sensor_status.dart';
import 'package:iiot_monitoring/src/core/monitoring/sensor_evaluator.dart';
import 'package:iiot_monitoring/src/core/monitoring/sensor_processing_notifier.dart';
import 'package:iiot_monitoring/src/shared/models/metric.dart';
import 'package:iiot_monitoring/src/features/dashboard/data/device_repository.dart';
import 'package:iiot_monitoring/src/features/dashboard/data/mapper.dart';
import 'package:iiot_monitoring/src/core/network/signalr_service.dart';

part 'calculated_device_notifier.g.dart';

@Riverpod(keepAlive: true)
class CalculatedDeviceNotifier extends _$CalculatedDeviceNotifier {
  StreamSubscription<Metric>? _metricsSubscription;

  @override
  Future<List<CalculatedDevice>> build() async {
    print('Notifier: Starting initialization...');

    final repository = ref.watch(deviceRepositoryProvider);
    final signalR = ref.watch(signalRServiceProvider);

    print('Notifier: Fetching devices from repository...');
    final deviceDtos = await repository.getDevices();
    print('Notifier: Received ${deviceDtos.length} device DTOs');

    final devices = deviceDtos
        .map((dto) => Mapper.toCalculatedDevice(dto))
        .toList();

    // Начальная инициализация истории
    for (var device in devices) {
      for (var sensor in device.sensors) {
        ref
            .read(sensorProcessingProvider.notifier)
            .updateEvaluation(sensor.sensor.sensorId, sensor.evaluation);
      }
    }

    // Запускаем SignalR
    print('Notifier: Starting SignalR service...');
    unawaited(signalR.start());

    // Подписываемся на метрики
    print('Notifier: Subscribing to metrics stream...');
    _metricsSubscription?.cancel();
    _metricsSubscription = signalR.metricsStream.listen((metric) {
      processMetric(metric);
    });

    ref.onDispose(() {
      print('Notifier: Disposing notifier and cancelling subscription');
      _metricsSubscription?.cancel();
    });

    print(
      'Notifier: Initialization complete. Total devices: ${devices.length}',
    );
    return devices;
  }

  void processMetric(Metric metric) {
    // print('Notifier: Processing metric for sensor ${metric.sensorId}, value: ${metric.value}');

    state.whenData((devices) {
      bool sensorFound = false;
      final updatedDevices = devices.map((device) {
        final sensorIndex = device.sensors.indexWhere(
          (s) => s.sensor.sensorId == metric.sensorId,
        );

        if (sensorIndex == -1) return device;

        sensorFound = true;
        // print('Notifier: Found sensor in device ${device.device.name}');

        final previousEvaluation = ref.read(
          sensorProcessingProvider,
        )[metric.sensorId];

        final newEvaluation = SensorEvaluator.evaluate(
          sensor: device.sensors[sensorIndex].sensor,
          value: metric.value,
          previousEvaluation: previousEvaluation,
        );

        ref
            .read(sensorProcessingProvider.notifier)
            .updateEvaluation(metric.sensorId, newEvaluation);

        final updatedSensors = List<CalculatedSensor>.from(device.sensors);
        updatedSensors[sensorIndex] = updatedSensors[sensorIndex].copyWith(
          evaluation: newEvaluation,
        );

        return device.copyWith(
          sensors: updatedSensors,
          summary: _recalculateSummary(updatedSensors),
        );
      }).toList();

      if (!sensorFound) {
        // print('Notifier: Warning! Received metric for unknown sensor ID: ${metric.sensorId}');
      } else {
        state = AsyncData(updatedDevices);
      }
    });
  }

  DeviceSummary _recalculateSummary(List<CalculatedSensor> sensors) {
    int normal = 0, warning = 0, critical = 0, offline = 0, noConfig = 0;
    for (var s in sensors) {
      switch (s.evaluation.status) {
        case SensorStatus.normal:
          normal++;
          break;
        case SensorStatus.warning:
          warning++;
          break;
        case SensorStatus.critical:
          critical++;
          break;
        case SensorStatus.offline:
          offline++;
          break;
        case SensorStatus.noConfig:
          noConfig++;
          break;
        case SensorStatus.idle:
          break;
      }
    }
    return DeviceSummary(
      normalCount: normal,
      warningCount: warning,
      criticalCount: critical,
      offlineCount: offline,
      noConfigCount: noConfig,
    );
  }
}
