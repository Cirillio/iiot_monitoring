// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_processing_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SensorProcessingNotifier)
final sensorProcessingProvider = SensorProcessingNotifierProvider._();

final class SensorProcessingNotifierProvider
    extends
        $NotifierProvider<
          SensorProcessingNotifier,
          Map<int, SensorEvaluation>
        > {
  SensorProcessingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sensorProcessingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sensorProcessingNotifierHash();

  @$internal
  @override
  SensorProcessingNotifier create() => SensorProcessingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, SensorEvaluation> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, SensorEvaluation>>(value),
    );
  }
}

String _$sensorProcessingNotifierHash() =>
    r'1c7468eea39eb7667e0202c259463951013596d3';

abstract class _$SensorProcessingNotifier
    extends $Notifier<Map<int, SensorEvaluation>> {
  Map<int, SensorEvaluation> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<Map<int, SensorEvaluation>, Map<int, SensorEvaluation>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<int, SensorEvaluation>,
                Map<int, SensorEvaluation>
              >,
              Map<int, SensorEvaluation>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
