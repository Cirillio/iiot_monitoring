import 'package:freezed_annotation/freezed_annotation.dart';

import 'sensor_ui_config.dart';

part 'sensor.freezed.dart';
part 'sensor.g.dart';

@freezed
abstract class Sensor with _$Sensor {
  const factory Sensor({
    required int sensorId,
    required int deviceId,
    required String name,
    required int sensorDataType,
    String? unit,
    SensorUiConfig? uiConfigJson,
    @JsonKey(includeFromJson: false, includeToJson: false) double? currentValue,
  }) = _Sensor;

  factory Sensor.fromJson(Map<String, dynamic> json) => _$SensorFromJson(json);
}
