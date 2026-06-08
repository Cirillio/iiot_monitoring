import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_status.freezed.dart';
part 'system_status.g.dart';

enum ServiceStatus {
  @JsonValue('ONLINE')
  online,
  @JsonValue('OFFLINE')
  offline,
  @JsonValue('DEGRADED')
  degraded,
  @JsonValue('CRITICAL_ERROR')
  criticalError,
  @JsonValue('MAINTENANCE')
  maintenance,
}

@freezed
abstract class SystemStatus with _$SystemStatus {
  const factory SystemStatus({
    @Default('') String serviceName,
    @Default(ServiceStatus.offline) ServiceStatus status,
    @Default(0) int uptimeSeconds,
    String? lastError,
    DateTime? lastSync,
  }) = _SystemStatus;

  factory SystemStatus.fromJson(Map<String, dynamic> json) =>
      _$SystemStatusFromJson(json);
}
