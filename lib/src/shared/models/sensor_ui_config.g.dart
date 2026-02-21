// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_ui_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SensorUiConfig _$SensorUiConfigFromJson(Map<String, dynamic> json) =>
    _SensorUiConfig(
      color: json['color'] as String?,
      icon: json['icon'] as String?,
      mainPagePosition: (json['mainPagePosition'] as num?)?.toInt(),
      graphPosition: (json['graphPosition'] as num?)?.toInt(),
      tablePosition: (json['tablePosition'] as num?)?.toInt(),
      alarmPosition: (json['alarmPosition'] as num?)?.toInt(),
      historyPosition: (json['historyPosition'] as num?)?.toInt(),
      minCritical: (json['minCritical'] as num?)?.toDouble(),
      minWarning: (json['minWarning'] as num?)?.toDouble(),
      maxWarning: (json['maxWarning'] as num?)?.toDouble(),
      maxCritical: (json['maxCritical'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SensorUiConfigToJson(_SensorUiConfig instance) =>
    <String, dynamic>{
      'color': instance.color,
      'icon': instance.icon,
      'mainPagePosition': instance.mainPagePosition,
      'graphPosition': instance.graphPosition,
      'tablePosition': instance.tablePosition,
      'alarmPosition': instance.alarmPosition,
      'historyPosition': instance.historyPosition,
      'minCritical': instance.minCritical,
      'minWarning': instance.minWarning,
      'maxWarning': instance.maxWarning,
      'maxCritical': instance.maxCritical,
    };
