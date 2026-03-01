import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iiot_monitoring/src/shared/models/sensor.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/sensor_evaluation.dart';

part 'calculated_sensor.freezed.dart';
part 'calculated_sensor.g.dart';

@freezed
abstract class CalculatedSensor with _$CalculatedSensor {
  const factory CalculatedSensor({
    required Sensor sensor,
    required SensorEvaluation evaluation,
  }) = _CalculatedSensor;

  factory CalculatedSensor.fromJson(Map<String, dynamic> json) =>
      _$CalculatedSensorFromJson(json);
}
