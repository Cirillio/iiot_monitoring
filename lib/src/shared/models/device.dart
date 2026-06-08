import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iiot_monitoring/src/shared/models/tag.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
abstract class Device with _$Device {
  const Device._();

  const factory Device({
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
    @Default([]) List<Tag> tags,
    @Default(0) int totalTags,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}
