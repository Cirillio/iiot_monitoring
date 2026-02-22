// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Device _$DeviceFromJson(Map<String, dynamic> json) => _Device(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String?,
  ipAddress: json['ipAddress'] as String?,
  port: (json['port'] as num?)?.toInt(),
  slaveId: (json['slaveId'] as num?)?.toInt(),
  isActive: json['isActive'] as bool,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  sensors:
      (json['sensors'] as List<dynamic>?)
          ?.map((e) => Sensor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  totalSensors: (json['totalSensors'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DeviceToJson(_Device instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'ipAddress': instance.ipAddress,
  'port': instance.port,
  'slaveId': instance.slaveId,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt?.toIso8601String(),
  'sensors': instance.sensors,
  'totalSensors': instance.totalSensors,
};
