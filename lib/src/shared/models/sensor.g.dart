// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sensor _$SensorFromJson(Map<String, dynamic> json) => _Sensor(
  sensorId: (json['sensorId'] as num).toInt(),
  deviceId: (json['deviceId'] as num).toInt(),
  name: json['name'] as String,
  sensorDataType: (json['sensorDataType'] as num).toInt(),
  unit: json['unit'] as String?,
  uiConfigJson: json['uiConfigJson'] == null
      ? null
      : SensorUiConfig.fromJson(json['uiConfigJson'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SensorToJson(_Sensor instance) => <String, dynamic>{
  'sensorId': instance.sensorId,
  'deviceId': instance.deviceId,
  'name': instance.name,
  'sensorDataType': instance.sensorDataType,
  'unit': instance.unit,
  'uiConfigJson': instance.uiConfigJson,
};
