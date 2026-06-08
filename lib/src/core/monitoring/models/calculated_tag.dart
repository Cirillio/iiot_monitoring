import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iiot_monitoring/src/shared/models/tag.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/tag_evaluation.dart';

part 'calculated_tag.freezed.dart';

@freezed
abstract class CalculatedTag with _$CalculatedTag {
  const CalculatedTag._();

  const factory CalculatedTag({
    required Tag tag,
    required TagEvaluation evaluation,
  }) = _CalculatedTag;
}
