// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Device _$DeviceFromJson(Map<String, dynamic> json) => _Device(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  ipAddress: json['ipAddress'] as String,
  isActive: json['isActive'] as bool,
  sensors:
      (json['sensors'] as List<dynamic>?)
          ?.map((e) => Sensor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$DeviceToJson(_Device instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'ipAddress': instance.ipAddress,
  'isActive': instance.isActive,
  'sensors': instance.sensors,
};
