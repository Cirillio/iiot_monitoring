// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceSummary _$DeviceSummaryFromJson(Map<String, dynamic> json) =>
    _DeviceSummary(
      normalCount: (json['normalCount'] as num?)?.toInt() ?? 0,
      warningCount: (json['warningCount'] as num?)?.toInt() ?? 0,
      criticalCount: (json['criticalCount'] as num?)?.toInt() ?? 0,
      offlineCount: (json['offlineCount'] as num?)?.toInt() ?? 0,
      noConfigCount: (json['noConfigCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DeviceSummaryToJson(_DeviceSummary instance) =>
    <String, dynamic>{
      'normalCount': instance.normalCount,
      'warningCount': instance.warningCount,
      'criticalCount': instance.criticalCount,
      'offlineCount': instance.offlineCount,
      'noConfigCount': instance.noConfigCount,
    };
