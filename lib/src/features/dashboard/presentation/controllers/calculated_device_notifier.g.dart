// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculated_device_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CalculatedDeviceNotifier)
final calculatedDeviceProvider = CalculatedDeviceNotifierProvider._();

final class CalculatedDeviceNotifierProvider
    extends
        $AsyncNotifierProvider<
          CalculatedDeviceNotifier,
          List<CalculatedDevice>
        > {
  CalculatedDeviceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calculatedDeviceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calculatedDeviceNotifierHash();

  @$internal
  @override
  CalculatedDeviceNotifier create() => CalculatedDeviceNotifier();
}

String _$calculatedDeviceNotifierHash() =>
    r'e6802a4148c48301dcd8d0f1c6c52a2318aa7009';

abstract class _$CalculatedDeviceNotifier
    extends $AsyncNotifier<List<CalculatedDevice>> {
  FutureOr<List<CalculatedDevice>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<CalculatedDevice>>, List<CalculatedDevice>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<CalculatedDevice>>,
                List<CalculatedDevice>
              >,
              AsyncValue<List<CalculatedDevice>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
