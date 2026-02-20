// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_ui_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SensorUiConfig _$SensorUiConfigFromJson(Map<String, dynamic> json) =>
    _SensorUiConfig(
      color: json['color'] as String?,
      icon: json['icon'] as String?,
      minCritical: (json['minCritical'] as num?)?.toDouble(),
      maxCritical: (json['maxCritical'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SensorUiConfigToJson(_SensorUiConfig instance) =>
    <String, dynamic>{
      'color': instance.color,
      'icon': instance.icon,
      'minCritical': instance.minCritical,
      'maxCritical': instance.maxCritical,
    };
