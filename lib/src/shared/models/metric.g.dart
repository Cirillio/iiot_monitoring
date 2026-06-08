// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Metric _$MetricFromJson(Map<String, dynamic> json) => _Metric(
  tagId: (json['tagId'] as num).toInt(),
  value: (json['value'] as num).toDouble(),
  time: DateTime.parse(json['time'] as String),
  rawValue: (json['rawValue'] as num?)?.toDouble(),
);

Map<String, dynamic> _$MetricToJson(_Metric instance) => <String, dynamic>{
  'tagId': instance.tagId,
  'value': instance.value,
  'time': instance.time.toIso8601String(),
  'rawValue': instance.rawValue,
};
