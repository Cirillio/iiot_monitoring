// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Metric _$MetricFromJson(Map<String, dynamic> json) => _Metric(
  sensorId: (json['SensorId'] as num).toInt(),
  value: (json['Value'] as num).toDouble(),
  time: DateTime.parse(json['Time'] as String),
  rawValue: (json['RawValue'] as num?)?.toDouble(),
);

Map<String, dynamic> _$MetricToJson(_Metric instance) => <String, dynamic>{
  'SensorId': instance.sensorId,
  'Value': instance.value,
  'Time': instance.time.toIso8601String(),
  'RawValue': instance.rawValue,
};
