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
      minWarning: (json['minWarning'] as num?)?.toDouble(),
      maxWarning: (json['maxWarning'] as num?)?.toDouble(),
      maxCritical: (json['maxCritical'] as num?)?.toDouble(),
      digitalWarning: (json['digitalWarning'] as num?)?.toDouble(),
      digitalCritical: (json['digitalCritical'] as num?)?.toDouble(),
      labelZero: json['labelZero'] as String?,
      labelOne: json['labelOne'] as String?,
    );

Map<String, dynamic> _$SensorUiConfigToJson(_SensorUiConfig instance) =>
    <String, dynamic>{
      'color': instance.color,
      'icon': instance.icon,
      'minCritical': instance.minCritical,
      'minWarning': instance.minWarning,
      'maxWarning': instance.maxWarning,
      'maxCritical': instance.maxCritical,
      'digitalWarning': instance.digitalWarning,
      'digitalCritical': instance.digitalCritical,
      'labelZero': instance.labelZero,
      'labelOne': instance.labelOne,
    };
