// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Metric _$MetricFromJson(Map<String, dynamic> json) => _Metric(
  sensorId: (json['sensorId'] as num).toInt(),
  value: (json['value'] as num).toDouble(),
  time: DateTime.parse(json['time'] as String),
);

Map<String, dynamic> _$MetricToJson(_Metric instance) => <String, dynamic>{
  'sensorId': instance.sensorId,
  'value': instance.value,
  'time': instance.time.toIso8601String(),
};
