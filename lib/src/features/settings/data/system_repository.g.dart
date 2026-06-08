// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(systemRepository)
final systemRepositoryProvider = SystemRepositoryProvider._();

final class SystemRepositoryProvider
    extends
        $FunctionalProvider<
          SystemRepository,
          SystemRepository,
          SystemRepository
        >
    with $Provider<SystemRepository> {
  SystemRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'systemRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$systemRepositoryHash();

  @$internal
  @override
  $ProviderElement<SystemRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SystemRepository create(Ref ref) {
    return systemRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SystemRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SystemRepository>(value),
    );
  }
}

String _$systemRepositoryHash() => r'0ee3709ee71fd2b07ce07b7b22bf31daa026556e';
