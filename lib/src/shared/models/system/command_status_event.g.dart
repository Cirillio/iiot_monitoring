// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command_status_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommandStatusEvent _$CommandStatusEventFromJson(Map<String, dynamic> json) =>
    _CommandStatusEvent(
      commandId: (json['commandId'] as num).toInt(),
      status: $enumDecode(_$CommandStatusEnumMap, json['status']),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$CommandStatusEventToJson(_CommandStatusEvent instance) =>
    <String, dynamic>{
      'commandId': instance.commandId,
      'status': _$CommandStatusEnumMap[instance.status]!,
      'errorMessage': instance.errorMessage,
    };

const _$CommandStatusEnumMap = {
  CommandStatus.pending: 'PENDING',
  CommandStatus.processing: 'PROCESSING',
  CommandStatus.success: 'SUCCESS',
  CommandStatus.failed: 'FAILED',
};
