import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iiot_monitoring/src/shared/models/enums.dart';
import 'package:iiot_monitoring/src/shared/models/tag_ui_config.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
abstract class Tag with _$Tag {
  const Tag._();

  const factory Tag({
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
    // Realtime fields
    double? currentValue,
    DateTime? lastTagUpdated,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
