import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iiot_monitoring/src/shared/models/sensor.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
abstract class Device with _$Device {
  const factory Device({
    required int id,
    String? name,
    String? ipAddress,
    int? port,
    int? slaveId,
    required bool isActive,
    DateTime? createdAt,
    @Default([]) List<Sensor> sensors,
    @Default(0) int totalSensors,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}

// Force update 1
