import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/sensor_evaluation.dart';

part 'sensor_processing_notifier.g.dart';

@Riverpod(keepAlive: true)
class SensorProcessingNotifier extends _$SensorProcessingNotifier {
  @override
  Map<int, SensorEvaluation> build() {
    return {};
  }

  void updateEvaluation(int sensorId, SensorEvaluation evaluation) {
    state = {
      ...state,
      sensorId: evaluation,
    };
  }
}
