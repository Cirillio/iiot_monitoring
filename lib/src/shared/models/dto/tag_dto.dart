import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums.dart';
import '../tag_ui_config.dart';

part 'tag_dto.freezed.dart';
part 'tag_dto.g.dart';

@freezed
abstract class TagDto with _$TagDto {
  const TagDto._();

  const factory TagDto({
    required int tagId,
    required int deviceId,
    int? portNumber,
    @Default("Unnamed tag") String name,
    @Default("unnamed-tag") String slug,
    required TagDataType dataType,
    @Default("UnknownUnit") String unit,
    TagUiConfig? uiConfigJson,
    DateTime? updatedAt,
    // Full Tag fields
    double? inputMin,
    double? inputMax,
    double? outputMin,
    double? outputMax,
    double? offsetVal,
    int? registerAddress,
    RegisterType? registerType,
    int? registerCount,
    ModbusEndianness? endianness,
    double? deadbandThreshold,
  }) = _TagDto;

  factory TagDto.fromJson(Map<String, dynamic> json) =>
      _$TagDtoFromJson(json);
}
