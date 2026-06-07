import '../../../core/monitoring/models/calculated_device.dart';
import '../../../core/monitoring/models/calculated_sensor.dart';
import '../../../core/monitoring/models/device_summary.dart';
import '../../../core/monitoring/models/sensor_evaluation.dart';
import '../../../core/monitoring/models/sensor_status.dart';
import '../../../shared/models/device.dart';
import '../../../shared/models/sensor.dart';
import '../../../shared/models/dto/device_dto.dart';
import '../../../shared/models/dto/sensor_dto.dart';

class Mapper {
  static CalculatedDevice toCalculatedDevice(DeviceDto dto) {
    final device = Device(
      id: dto.id,
      name: dto.name,
      ipAddress: dto.ipAddress,
      port: dto.port,
      slaveId: dto.slaveId,
      isActive: dto.isActive,
      createdAt: dto.createdAt,
    );

    final sensors = dto.sensors.map((s) => toCalculatedSensor(s)).toList();

    return CalculatedDevice(
      device: device,
      sensors: sensors,
      summary: _calculateSummary(sensors),
    );
  }

  static CalculatedSensor toCalculatedSensor(SensorDto dto) {
    final sensor = Sensor(
      sensorId: dto.sensorId,
      deviceId: dto.deviceId,
      portNumber: dto.portNumber,
      name: dto.name,
      slug: dto.slug,
      sensorDataType: dto.sensorDataType,
      unit: dto.unit,
      uiConfigJson: dto.uiConfigJson,
      updatedAt: dto.updatedAt,
    );

    return CalculatedSensor(
      sensor: sensor,
      evaluation: SensorEvaluation.idle(),
    );
  }

  static DeviceSummary _calculateSummary(List<CalculatedSensor> sensors) {
    int normal = 0, warning = 0, critical = 0, offline = 0, noConfig = 0;
    for (var s in sensors) {
      switch (s.evaluation.status) {
        case SensorStatus.normal:
          normal++;
        case SensorStatus.warning:
          warning++;
        case SensorStatus.critical:
          critical++;
        case SensorStatus.offline:
          offline++;
        case SensorStatus.noConfig:
          noConfig++;
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
