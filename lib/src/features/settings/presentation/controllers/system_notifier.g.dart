// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SystemConfigNotifier)
final systemConfigProvider = SystemConfigNotifierProvider._();

final class SystemConfigNotifierProvider
    extends $AsyncNotifierProvider<SystemConfigNotifier, SystemConfig> {
  SystemConfigNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'systemConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$systemConfigNotifierHash();

  @$internal
  @override
  SystemConfigNotifier create() => SystemConfigNotifier();
}

String _$systemConfigNotifierHash() =>
    r'405424022a87d208e0871ce0b2748c48774b3963';

abstract class _$SystemConfigNotifier extends $AsyncNotifier<SystemConfig> {
  FutureOr<SystemConfig> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SystemConfig>, SystemConfig>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SystemConfig>, SystemConfig>,
              AsyncValue<SystemConfig>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SystemStatusNotifier)
final systemStatusProvider = SystemStatusNotifierProvider._();

final class SystemStatusNotifierProvider
    extends $AsyncNotifierProvider<SystemStatusNotifier, List<SystemStatus>> {
  SystemStatusNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'systemStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$systemStatusNotifierHash();

  @$internal
  @override
  SystemStatusNotifier create() => SystemStatusNotifier();
}

String _$systemStatusNotifierHash() =>
    r'fa1c34ce08d768287b8c5246b2501a7b01cc51ea';

abstract class _$SystemStatusNotifier
    extends $AsyncNotifier<List<SystemStatus>> {
  FutureOr<List<SystemStatus>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<SystemStatus>>, List<SystemStatus>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<SystemStatus>>, List<SystemStatus>>,
              AsyncValue<List<SystemStatus>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
