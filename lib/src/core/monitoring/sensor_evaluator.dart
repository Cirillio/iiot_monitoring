import '../monitoring/models/sensor_evaluation.dart';
import '../monitoring/models/sensor_status.dart';
import '../../shared/models/sensor.dart';

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
        message: 'No threshold configuration',
      );
    }

    final maxCritical = config.maxCritical;
    final maxWarning = config.maxWarning;
    final minCritical = config.minCritical;

    if (maxCritical == null || maxWarning == null || minCritical == null) {
      return SensorEvaluation(
        status: SensorStatus.noConfig,
        value: value,
        message: 'Incomplete threshold configuration',
      );
    }

    // Гистерезис: 2% от диапазона
    final range = maxCritical - minCritical;
    final noise = range * 0.02;

    final prevStatus = previousEvaluation?.status ?? SensorStatus.idle;
    SensorStatus newStatus = SensorStatus.normal;

    // Логика переключения статусов с учетом гистерезиса
    if (value >= maxCritical) {
      newStatus = SensorStatus.critical;
    } else if (prevStatus == SensorStatus.critical && value >= maxCritical - noise) {
      newStatus = SensorStatus.critical;
    } else if (value >= maxWarning) {
      newStatus = SensorStatus.warning;
    } else if (prevStatus == SensorStatus.warning && value >= maxWarning - noise) {
      newStatus = SensorStatus.warning;
    } else {
      newStatus = SensorStatus.normal;
    }

    DateTime? alarmStartedAt = previousEvaluation?.alarmStartedAt;
    if (newStatus != SensorStatus.normal && newStatus != SensorStatus.idle) {
      // Если это новый аларм
      if (prevStatus == SensorStatus.normal || prevStatus == SensorStatus.idle) {
        alarmStartedAt = DateTime.now();
      }
    } else {
      alarmStartedAt = null;
    }

    String message = _getMessageForStatus(newStatus, value, sensor.unit ?? '');

    return SensorEvaluation(
      status: newStatus,
      value: value,
      alarmStartedAt: alarmStartedAt,
      message: message,
    );
  }

  static String _getMessageForStatus(SensorStatus status, double value, String unit) {
    switch (status) {
      case SensorStatus.critical:
        return 'Critical value: ${value.toStringAsFixed(2)} $unit';
      case SensorStatus.warning:
        return 'Warning value: ${value.toStringAsFixed(2)} $unit';
      case SensorStatus.normal:
        return 'Normal';
      default:
        return '';
    }
  }
}
