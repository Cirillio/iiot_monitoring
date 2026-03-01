import 'package:freezed_annotation/freezed_annotation.dart';
import 'sensor_dto.dart';

part 'device_dto.freezed.dart';
part 'device_dto.g.dart';

@freezed
abstract class DeviceDto with _$DeviceDto {
  const factory DeviceDto({
    required int id,
    String? name,
    String? ipAddress,
    int? port,
    int? slaveId,
    required bool isActive,
    DateTime? createdAt,
    @Default([]) List<SensorDto> sensors,
    @Default(0) int totalSensors,
  }) = _DeviceDto;

  factory DeviceDto.fromJson(Map<String, dynamic> json) =>
      _$DeviceDtoFromJson(json);
}
