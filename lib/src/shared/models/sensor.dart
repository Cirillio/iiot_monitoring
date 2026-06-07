import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iiot_monitoring/src/shared/models/sensor_ui_config.dart';

part 'sensor.freezed.dart';
part 'sensor.g.dart';

@freezed
abstract class Sensor with _$Sensor {
  const Sensor._();

  const factory Sensor({
    required int sensorId,
    int? deviceId,
    int? portNumber,
    String? name,
    String? slug,
    required int sensorDataType,
    String? unit,
    SensorUiConfig? uiConfigJson,
    DateTime? updatedAt,
    double? currentValue,
    DateTime? lastSensorUpdated,
  }) = _Sensor;

  factory Sensor.fromJson(Map<String, dynamic> json) => _$SensorFromJson(json);
}
