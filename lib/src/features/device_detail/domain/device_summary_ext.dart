import 'package:iiot_monitoring/src/shared/models/device.dart';
import 'sensor_status_ext.dart';

/// Расширение для получения сводной информации по устройству.
extension DeviceSummaryExt on Device {
  /// Возвращает количество датчиков в нормальном статусе.
  int get normalSensorsCount {
    return sensors.where((sensor) {
      final status = sensor.status;
      return status == SensorStatus.normal;
    }).length;
  }

  /// Возвращает количество датчиков со статусом предупреждения.
  int get warningSensorsCount {
    return sensors.where((sensor) {
      final status = sensor.status;
      return status == SensorStatus.warning;
    }).length;
  }

  /// Возвращает количество датчиков с критическим статусом.
  int get criticalSensorsCount {
    return sensors.where((sensor) {
      final status = sensor.status;
      return status == SensorStatus.critical;
    }).length;
  }

  /// Возвращает количество датчиков с неизвестным статусом (нет конфига).
  int get unknownSensorsCount {
    return sensors.where((sensor) {
      final status = sensor.status;
      return status == SensorStatus.unknown;
    }).length;
  }

  /// Возвращает количество датчиков офлайн (нет данных).
  int get offlineSensorsCount {
    return sensors.where((sensor) {
      final status = sensor.status;
      return status == SensorStatus.offline;
    }).length;
  }

  /// Возвращает общее количество датчиков с проблемами (warning + critical).
  int get alertSensorsCount {
    return warningSensorsCount + criticalSensorsCount;
  }

  /// Возвращает true, если все датчики в норме.
  bool get allSensorsNormal {
    return alertSensorsCount == 0 && unknownSensorsCount == 0 && offlineSensorsCount == 0;
  }
}
