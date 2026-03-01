import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iiot_monitoring/src/shared/models/device.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/calculated_sensor.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/device_summary.dart';

part 'calculated_device.freezed.dart';
part 'calculated_device.g.dart';

@freezed
abstract class CalculatedDevice with _$CalculatedDevice {
  const factory CalculatedDevice({
    required Device device,
    required List<CalculatedSensor> sensors,
    required DeviceSummary summary,
  }) = _CalculatedDevice;

  factory CalculatedDevice.fromJson(Map<String, dynamic> json) =>
      _$CalculatedDeviceFromJson(json);
}
