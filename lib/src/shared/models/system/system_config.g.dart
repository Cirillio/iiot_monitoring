// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SystemConfig _$SystemConfigFromJson(Map<String, dynamic> json) =>
    _SystemConfig(
      id: (json['id'] as num).toInt(),
      rawRetentionDays: (json['rawRetentionDays'] as num?)?.toInt() ?? 90,
      aggRetentionDays: (json['aggRetentionDays'] as num?)?.toInt() ?? 1825,
      pollingIntervalMs: (json['pollingIntervalMs'] as num?)?.toInt() ?? 1000,
      configReloadIntervalSec:
          (json['configReloadIntervalSec'] as num?)?.toInt() ?? 60,
      healthCheckIntervalSec:
          (json['healthCheckIntervalSec'] as num?)?.toInt() ?? 30,
      deadbandThreshold:
          (json['deadbandThreshold'] as num?)?.toDouble() ?? 0.01,
      dataHeartbeatSec: (json['dataHeartbeatSec'] as num?)?.toInt() ?? 600,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$SystemConfigToJson(_SystemConfig instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rawRetentionDays': instance.rawRetentionDays,
      'aggRetentionDays': instance.aggRetentionDays,
      'pollingIntervalMs': instance.pollingIntervalMs,
      'configReloadIntervalSec': instance.configReloadIntervalSec,
      'healthCheckIntervalSec': instance.healthCheckIntervalSec,
      'deadbandThreshold': instance.deadbandThreshold,
      'dataHeartbeatSec': instance.dataHeartbeatSec,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
