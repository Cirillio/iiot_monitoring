import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/tag_evaluation.dart';

part 'tag_processing_notifier.g.dart';

@Riverpod(keepAlive: true)
class TagProcessingNotifier extends _$TagProcessingNotifier {
  @override
  Map<int, TagEvaluation> build() {
    return {};
  }

  void updateEvaluation(int tagId, TagEvaluation evaluation) {
    state = {
      ...state,
      tagId: evaluation,
    };
  }
}
