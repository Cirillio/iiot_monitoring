// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Device _$DeviceFromJson(Map<String, dynamic> json) => _Device(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String? ?? "Unnamed Device",
  connectionId: (json['connectionId'] as num).toInt(),
  ipAddress: json['ipAddress'] as String? ?? "127.0.0.1",
  port: (json['port'] as num).toInt(),
  slaveId: (json['slaveId'] as num).toInt(),
  useGroupPolling: json['useGroupPolling'] as bool? ?? true,
  maxRegisterSpan: (json['maxRegisterSpan'] as num?)?.toInt() ?? 120,
  isActive: json['isActive'] as bool? ?? false,
  isOnline: json['isOnline'] as bool? ?? false,
  lastSeen: json['lastSeen'] == null
      ? null
      : DateTime.parse(json['lastSeen'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  tags:
      (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  totalTags: (json['totalTags'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DeviceToJson(_Device instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'connectionId': instance.connectionId,
  'ipAddress': instance.ipAddress,
  'port': instance.port,
  'slaveId': instance.slaveId,
  'useGroupPolling': instance.useGroupPolling,
  'maxRegisterSpan': instance.maxRegisterSpan,
  'isActive': instance.isActive,
  'isOnline': instance.isOnline,
  'lastSeen': instance.lastSeen?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'tags': instance.tags,
  'totalTags': instance.totalTags,
};
