// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SystemStatus _$SystemStatusFromJson(Map<String, dynamic> json) =>
    _SystemStatus(
      serviceName: json['serviceName'] as String? ?? '',
      status:
          $enumDecodeNullable(_$ServiceStatusEnumMap, json['status']) ??
          ServiceStatus.offline,
      uptimeSeconds: (json['uptimeSeconds'] as num?)?.toInt() ?? 0,
      lastError: json['lastError'] as String?,
      lastSync: json['lastSync'] == null
          ? null
          : DateTime.parse(json['lastSync'] as String),
    );

Map<String, dynamic> _$SystemStatusToJson(_SystemStatus instance) =>
    <String, dynamic>{
      'serviceName': instance.serviceName,
      'status': _$ServiceStatusEnumMap[instance.status]!,
      'uptimeSeconds': instance.uptimeSeconds,
      'lastError': instance.lastError,
      'lastSync': instance.lastSync?.toIso8601String(),
    };

const _$ServiceStatusEnumMap = {
  ServiceStatus.online: 'ONLINE',
  ServiceStatus.offline: 'OFFLINE',
  ServiceStatus.degraded: 'DEGRADED',
  ServiceStatus.criticalError: 'CRITICAL_ERROR',
  ServiceStatus.maintenance: 'MAINTENANCE',
};
