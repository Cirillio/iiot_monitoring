// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'write_command_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WriteCommandDto _$WriteCommandDtoFromJson(Map<String, dynamic> json) =>
    _WriteCommandDto(
      tagId: (json['tagId'] as num).toInt(),
      value: (json['value'] as num).toDouble(),
      operatorId: json['operatorId'] as String,
    );

Map<String, dynamic> _$WriteCommandDtoToJson(_WriteCommandDto instance) =>
    <String, dynamic>{
      'tagId': instance.tagId,
      'value': instance.value,
      'operatorId': instance.operatorId,
    };
