// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_evaluation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SensorEvaluation _$SensorEvaluationFromJson(Map<String, dynamic> json) =>
    _SensorEvaluation(
      status: $enumDecode(_$SensorStatusEnumMap, json['status']),
      value: (json['value'] as num?)?.toDouble(),
      alarmStartedAt: json['alarmStartedAt'] == null
          ? null
          : DateTime.parse(json['alarmStartedAt'] as String),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SensorEvaluationToJson(_SensorEvaluation instance) =>
    <String, dynamic>{
      'status': _$SensorStatusEnumMap[instance.status]!,
      'value': instance.value,
      'alarmStartedAt': instance.alarmStartedAt?.toIso8601String(),
      'message': instance.message,
    };

const _$SensorStatusEnumMap = {
  SensorStatus.idle: 'idle',
  SensorStatus.normal: 'normal',
  SensorStatus.warning: 'warning',
  SensorStatus.critical: 'critical',
  SensorStatus.offline: 'offline',
  SensorStatus.noConfig: 'noConfig',
};
