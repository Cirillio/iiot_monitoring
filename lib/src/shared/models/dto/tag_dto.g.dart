// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagDto _$TagDtoFromJson(Map<String, dynamic> json) => _TagDto(
  tagId: (json['tagId'] as num).toInt(),
  deviceId: (json['deviceId'] as num).toInt(),
  portNumber: (json['portNumber'] as num?)?.toInt(),
  name: json['name'] as String? ?? "Unnamed tag",
  slug: json['slug'] as String? ?? "unnamed-tag",
  dataType: $enumDecode(_$TagDataTypeEnumMap, json['dataType']),
  unit: json['unit'] as String? ?? "UnknownUnit",
  uiConfigJson: json['uiConfigJson'] == null
      ? null
      : TagUiConfig.fromJson(json['uiConfigJson'] as Map<String, dynamic>),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  inputMin: (json['inputMin'] as num?)?.toDouble(),
  inputMax: (json['inputMax'] as num?)?.toDouble(),
  outputMin: (json['outputMin'] as num?)?.toDouble(),
  outputMax: (json['outputMax'] as num?)?.toDouble(),
  offsetVal: (json['offsetVal'] as num?)?.toDouble(),
  registerAddress: (json['registerAddress'] as num?)?.toInt(),
  registerType: $enumDecodeNullable(
    _$RegisterTypeEnumMap,
    json['registerType'],
  ),
  registerCount: (json['registerCount'] as num?)?.toInt(),
  endianness: $enumDecodeNullable(
    _$ModbusEndiannessEnumMap,
    json['endianness'],
  ),
  deadbandThreshold: (json['deadbandThreshold'] as num?)?.toDouble(),
);

Map<String, dynamic> _$TagDtoToJson(_TagDto instance) => <String, dynamic>{
  'tagId': instance.tagId,
  'deviceId': instance.deviceId,
  'portNumber': instance.portNumber,
  'name': instance.name,
  'slug': instance.slug,
  'dataType': _$TagDataTypeEnumMap[instance.dataType]!,
  'unit': instance.unit,
  'uiConfigJson': instance.uiConfigJson,
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'inputMin': instance.inputMin,
  'inputMax': instance.inputMax,
  'outputMin': instance.outputMin,
  'outputMax': instance.outputMax,
  'offsetVal': instance.offsetVal,
  'registerAddress': instance.registerAddress,
  'registerType': _$RegisterTypeEnumMap[instance.registerType],
  'registerCount': instance.registerCount,
  'endianness': _$ModbusEndiannessEnumMap[instance.endianness],
  'deadbandThreshold': instance.deadbandThreshold,
};

const _$TagDataTypeEnumMap = {
  TagDataType.digital: 'DIGITAL',
  TagDataType.analogRaw: 'ANALOG_RAW',
  TagDataType.analogPhysical: 'ANALOG_PHYSICAL',
};

const _$RegisterTypeEnumMap = {
  RegisterType.coil: 'COIL',
  RegisterType.discreteInput: 'DISCRETE_INPUT',
  RegisterType.inputRegister: 'INPUT_REGISTER',
  RegisterType.holdingRegister: 'HOLDING_REGISTER',
};

const _$ModbusEndiannessEnumMap = {
  ModbusEndianness.bigEndian: 'BIG_ENDIAN',
  ModbusEndianness.littleEndian: 'LITTLE_ENDIAN',
  ModbusEndianness.wordSwap: 'WORD_SWAP',
  ModbusEndianness.byteWordSwap: 'BYTE_WORD_SWAP',
};
