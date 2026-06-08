// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeviceDetailController)
final deviceDetailControllerProvider = DeviceDetailControllerFamily._();

final class DeviceDetailControllerProvider
    extends
        $NotifierProvider<
          DeviceDetailController,
          AsyncValue<CalculatedDevice?>
        > {
  DeviceDetailControllerProvider._({
    required DeviceDetailControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'deviceDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deviceDetailControllerHash();

  @override
  String toString() {
    return r'deviceDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DeviceDetailController create() => DeviceDetailController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<CalculatedDevice?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<CalculatedDevice?>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceDetailControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deviceDetailControllerHash() =>
    r'1b3c764e38a01dfe48a291e75b24e95dae46b061';

final class DeviceDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          DeviceDetailController,
          AsyncValue<CalculatedDevice?>,
          AsyncValue<CalculatedDevice?>,
          AsyncValue<CalculatedDevice?>,
          int
        > {
  DeviceDetailControllerFamily._()
    : super(
        retry: null,
        name: r'deviceDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeviceDetailControllerProvider call(int deviceId) =>
      DeviceDetailControllerProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'deviceDetailControllerProvider';
}

abstract class _$DeviceDetailController
    extends $Notifier<AsyncValue<CalculatedDevice?>> {
  late final _$args = ref.$arg as int;
  int get deviceId => _$args;

  AsyncValue<CalculatedDevice?> build(int deviceId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<CalculatedDevice?>,
              AsyncValue<CalculatedDevice?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CalculatedDevice?>,
                AsyncValue<CalculatedDevice?>
              >,
              AsyncValue<CalculatedDevice?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
