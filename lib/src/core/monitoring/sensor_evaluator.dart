import 'package:iiot_monitoring/src/core/monitoring/models/sensor_evaluation.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/sensor_status.dart';
import 'package:iiot_monitoring/src/shared/models/sensor.dart';
import 'package:iiot_monitoring/src/shared/models/sensor_ui_config.dart';

class SensorEvaluator {
  static SensorEvaluation evaluate({
    required Sensor sensor,
    required double value,
    SensorEvaluation? previousEvaluation,
  }) {
    final config = sensor.uiConfigJson;

    if (config == null) {
      return SensorEvaluation(
        status: SensorStatus.noConfig,
        value: value,
        message: 'No configuration',
      );
    }

    final isDigital = sensor.sensorDataType == 1;
    final prevStatus = previousEvaluation?.status ?? SensorStatus.idle;
    SensorStatus newStatus = SensorStatus.normal;

    if (isDigital) {
      // Логика для DIGITAL датчиков
      if (config.digitalCritical != null && value == config.digitalCritical) {
        newStatus = SensorStatus.critical;
      } else if (config.digitalWarning != null &&
          value == config.digitalWarning) {
        newStatus = SensorStatus.warning;
      } else {
        newStatus = SensorStatus.normal;
      }
    } else {
      // Логика для ANALOG датчиков
      final maxCritical = config.maxCritical;
      final maxWarning = config.maxWarning;
      final minCritical = config.minCritical;

      if (maxCritical == null || maxWarning == null || minCritical == null) {
        return SensorEvaluation(
          status: SensorStatus.noConfig,
          value: value,
          message: 'Incomplete thresholds',
        );
      }

      // Гистерезис: 2% от диапазона
      final range = maxCritical - minCritical;
      final noise = range * 0.02;

      if (value >= maxCritical) {
        newStatus = SensorStatus.critical;
      } else if (prevStatus == SensorStatus.critical &&
          value >= maxCritical - noise) {
        newStatus = SensorStatus.critical;
      } else if (value >= maxWarning) {
        newStatus = SensorStatus.warning;
      } else if (prevStatus == SensorStatus.warning &&
          value >= maxWarning - noise) {
        newStatus = SensorStatus.warning;
      } else {
        newStatus = SensorStatus.normal;
      }
    }

    DateTime? alarmStartedAt = previousEvaluation?.alarmStartedAt;
    if (newStatus == SensorStatus.warning || newStatus == SensorStatus.critical) {
      // Если вошли в аларм из нормального состояния
      if (prevStatus == SensorStatus.normal || prevStatus == SensorStatus.idle) {
        alarmStartedAt = DateTime.now();
      }
    } else if (newStatus == SensorStatus.normal) {
      alarmStartedAt = null;
    }

    String message = _getMessageForStatus(newStatus, value, sensor, config);

    return SensorEvaluation(
      status: newStatus,
      value: value,
      alarmStartedAt: alarmStartedAt,
      message: message,
    );
  }

  static String _getMessageForStatus(
    SensorStatus status,
    double value,
    Sensor sensor,
    SensorUiConfig config,
  ) {
    if (status == SensorStatus.normal) return 'Normal';

    final unit = sensor.unit ?? '';
    String valueStr;

    if (sensor.sensorDataType == 1) {
      if (value == 0 && config.labelZero != null) {
        valueStr = config.labelZero!;
      } else if (value == 1 && config.labelOne != null) {
        valueStr = config.labelOne!;
      } else {
        valueStr = value.toStringAsFixed(0);
      }
    } else {
      valueStr = '${value.toStringAsFixed(2)} $unit';
    }

    switch (status) {
      case SensorStatus.critical:
        return 'Critical: $valueStr';
      case SensorStatus.warning:
        return 'Warning: $valueStr';
      default:
        return '';
    }
  }
}
