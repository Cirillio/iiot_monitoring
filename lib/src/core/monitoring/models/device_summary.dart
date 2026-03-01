import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_summary.freezed.dart';
part 'device_summary.g.dart';

@freezed
abstract class DeviceSummary with _$DeviceSummary {
  const factory DeviceSummary({
    @Default(0) int normalCount,
    @Default(0) int warningCount,
    @Default(0) int criticalCount,
    @Default(0) int offlineCount,
    @Default(0) int noConfigCount,
  }) = _DeviceSummary;

  factory DeviceSummary.fromJson(Map<String, dynamic> json) =>
      _$DeviceSummaryFromJson(json);

  factory DeviceSummary.empty() => const DeviceSummary();
}
