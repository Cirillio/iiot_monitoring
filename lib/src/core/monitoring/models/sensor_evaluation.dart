import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/sensor_status.dart';

part 'sensor_evaluation.freezed.dart';
part 'sensor_evaluation.g.dart';

@freezed
abstract class SensorEvaluation with _$SensorEvaluation {
  const factory SensorEvaluation({
    required SensorStatus status,
    double? value,
    DateTime? alarmStartedAt,
    String? message,
  }) = _SensorEvaluation;

  factory SensorEvaluation.fromJson(Map<String, dynamic> json) =>
      _$SensorEvaluationFromJson(json);

  factory SensorEvaluation.idle() =>
      const SensorEvaluation(status: SensorStatus.idle);
}
