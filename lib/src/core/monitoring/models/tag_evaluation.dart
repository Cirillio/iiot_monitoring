import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/tag_status.dart';

part 'tag_evaluation.freezed.dart';

@freezed
abstract class TagEvaluation with _$TagEvaluation {
  const TagEvaluation._();

  const factory TagEvaluation({
    required TagStatus status,
    double? value,
    DateTime? alarmStartedAt,
    String? message,
  }) = _TagEvaluation;

  factory TagEvaluation.idle() => const TagEvaluation(
        status: TagStatus.idle,
      );
}
