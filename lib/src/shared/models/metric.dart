import 'package:freezed_annotation/freezed_annotation.dart';

part 'metric.freezed.dart';
part 'metric.g.dart';

@freezed
abstract class Metric with _$Metric {
  const factory Metric({
    required int sensorId,
    required double value,
    required DateTime time,
  }) = _Metric;

  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);
}
