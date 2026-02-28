// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Riverpod провайдер для получения данных об устройстве по его ID.
///
/// Подписывается на главный список устройств из [dashboardControllerProvider]
/// и автоматически обновляется при изменении данных (в том числе через SignalR).

@ProviderFor(DeviceDetailController)
final deviceDetailControllerProvider = DeviceDetailControllerFamily._();

/// Riverpod провайдер для получения данных об устройстве по его ID.
///
/// Подписывается на главный список устройств из [dashboardControllerProvider]
/// и автоматически обновляется при изменении данных (в том числе через SignalR).
final class DeviceDetailControllerProvider
    extends $AsyncNotifierProvider<DeviceDetailController, Device> {
  /// Riverpod провайдер для получения данных об устройстве по его ID.
  ///
  /// Подписывается на главный список устройств из [dashboardControllerProvider]
  /// и автоматически обновляется при изменении данных (в том числе через SignalR).
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
    r'5d7c813a9914f5b9ec6b09f1e2d449b206a17015';

/// Riverpod провайдер для получения данных об устройстве по его ID.
///
/// Подписывается на главный список устройств из [dashboardControllerProvider]
/// и автоматически обновляется при изменении данных (в том числе через SignalR).

final class DeviceDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          DeviceDetailController,
          AsyncValue<Device>,
          Device,
          FutureOr<Device>,
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

  /// Riverpod провайдер для получения данных об устройстве по его ID.
  ///
  /// Подписывается на главный список устройств из [dashboardControllerProvider]
  /// и автоматически обновляется при изменении данных (в том числе через SignalR).

  DeviceDetailControllerProvider call(int deviceId) =>
      DeviceDetailControllerProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'deviceDetailControllerProvider';
}

/// Riverpod провайдер для получения данных об устройстве по его ID.
///
/// Подписывается на главный список устройств из [dashboardControllerProvider]
/// и автоматически обновляется при изменении данных (в том числе через SignalR).

abstract class _$DeviceDetailController extends $AsyncNotifier<Device> {
  late final _$args = ref.$arg as int;
  int get deviceId => _$args;

  FutureOr<Device> build(int deviceId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Device>, Device>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Device>, Device>,
              AsyncValue<Device>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
