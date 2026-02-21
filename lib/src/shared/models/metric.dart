import 'package:freezed_annotation/freezed_annotation.dart';

part 'metric.freezed.dart';
part 'metric.g.dart';

@freezed
abstract class Metric with _$Metric {
  const factory Metric({
    @JsonKey(name: 'SensorId') required int sensorId,
    @JsonKey(name: 'Value') required double value,
    @JsonKey(name: 'Time') required DateTime time,
    @JsonKey(name: 'RawValue') double? rawValue,
  }) = _Metric;

  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);
}
