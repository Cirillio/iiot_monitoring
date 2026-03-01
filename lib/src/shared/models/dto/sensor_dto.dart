import 'package:freezed_annotation/freezed_annotation.dart';
import '../sensor_ui_config.dart';

part 'sensor_dto.freezed.dart';
part 'sensor_dto.g.dart';

@freezed
abstract class SensorDto with _$SensorDto {
  const factory SensorDto({
    required int sensorId,
    int? deviceId,
    int? portNumber,
    String? name,
    String? slug,
    required int sensorDataType,
    String? unit,
    SensorUiConfig? uiConfigJson,
    DateTime? updatedAt,
  }) = _SensorDto;

  factory SensorDto.fromJson(Map<String, dynamic> json) =>
      _$SensorDtoFromJson(json);
}
