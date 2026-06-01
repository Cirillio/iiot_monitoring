// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SensorDto _$SensorDtoFromJson(Map<String, dynamic> json) => _SensorDto(
  sensorId: (json['sensorId'] as num).toInt(),
  deviceId: (json['deviceId'] as num?)?.toInt(),
  portNumber: (json['portNumber'] as num?)?.toInt(),
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  sensorDataType: (json['sensorDataType'] as num).toInt(),
  unit: json['unit'] as String?,
  uiConfigJson: json['uiConfigJson'] == null
      ? null
      : SensorUiConfig.fromJson(json['uiConfigJson'] as Map<String, dynamic>),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$SensorDtoToJson(_SensorDto instance) =>
    <String, dynamic>{
      'sensorId': instance.sensorId,
      'deviceId': instance.deviceId,
      'portNumber': instance.portNumber,
      'name': instance.name,
      'slug': instance.slug,
      'sensorDataType': instance.sensorDataType,
      'unit': instance.unit,
      'uiConfigJson': instance.uiConfigJson,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
