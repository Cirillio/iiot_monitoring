import 'package:freezed_annotation/freezed_annotation.dart';

enum TagDataType {
  @JsonValue('DIGITAL')
  digital,
  @JsonValue('ANALOG_RAW')
  analogRaw,
  @JsonValue('ANALOG_PHYSICAL')
  analogPhysical,
}

enum RegisterType {
  @JsonValue('COIL')
  coil,
  @JsonValue('DISCRETE_INPUT')
  discreteInput,
  @JsonValue('INPUT_REGISTER')
  inputRegister,
  @JsonValue('HOLDING_REGISTER')
  holdingRegister,
}

enum ModbusEndianness {
  @JsonValue('BIG_ENDIAN')
  bigEndian,
  @JsonValue('LITTLE_ENDIAN')
  littleEndian,
  @JsonValue('WORD_SWAP')
  wordSwap,
  @JsonValue('BYTE_WORD_SWAP')
  byteWordSwap,
}

enum RawDataType {
  @JsonValue('INT16')
  int16,
  @JsonValue('UINT16')
  uint16,
  @JsonValue('INT32')
  int32,
  @JsonValue('UINT32')
  uint32,
  @JsonValue('FLOAT32')
  float32,
  @JsonValue('FLOAT64')
  float64,
}
