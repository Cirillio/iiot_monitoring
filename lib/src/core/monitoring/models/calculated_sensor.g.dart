// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculated_sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalculatedSensor _$CalculatedSensorFromJson(Map<String, dynamic> json) =>
    _CalculatedSensor(
      sensor: Sensor.fromJson(json['sensor'] as Map<String, dynamic>),
      evaluation: SensorEvaluation.fromJson(
        json['evaluation'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CalculatedSensorToJson(_CalculatedSensor instance) =>
    <String, dynamic>{
      'sensor': instance.sensor,
      'evaluation': instance.evaluation,
    };
