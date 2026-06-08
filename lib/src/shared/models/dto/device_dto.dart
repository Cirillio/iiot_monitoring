import 'package:freezed_annotation/freezed_annotation.dart';
import 'tag_dto.dart';

part 'device_dto.freezed.dart';
part 'device_dto.g.dart';

@freezed
abstract class DeviceDto with _$DeviceDto {
  const DeviceDto._();

  const factory DeviceDto({
    required int id,
    @Default("Unnamed Device") String name,
    required int connectionId,
    @Default("127.0.0.1") String ipAddress,
    required int port,
    required int slaveId,
    @Default(true) bool useGroupPolling,
    @Default(120) int maxRegisterSpan,
    @Default(false) bool isActive,
    @Default(false) bool isOnline,
    DateTime? lastSeen,
    DateTime? createdAt,
    @Default([]) List<TagDto> tags,
    @Default(0) int totalTags,
  }) = _DeviceDto;

  factory DeviceDto.fromJson(Map<String, dynamic> json) => _$DeviceDtoFromJson(json);
}
