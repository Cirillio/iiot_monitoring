import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_config.freezed.dart';
part 'system_config.g.dart';

@freezed
abstract class SystemConfig with _$SystemConfig {
  const factory SystemConfig({
    required int id,
    @Default(90) int rawRetentionDays,
    @Default(1825) int aggRetentionDays,
    @Default(1000) int pollingIntervalMs,
    @Default(60) int configReloadIntervalSec,
    @Default(30) int healthCheckIntervalSec,
    @Default(0.01) double deadbandThreshold,
    @Default(600) int dataHeartbeatSec,
    DateTime? updatedAt,
  }) = _SystemConfig;

  factory SystemConfig.fromJson(Map<String, dynamic> json) =>
      _$SystemConfigFromJson(json);
}
