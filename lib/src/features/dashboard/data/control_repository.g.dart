// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(controlRepository)
final controlRepositoryProvider = ControlRepositoryProvider._();

final class ControlRepositoryProvider
    extends
        $FunctionalProvider<
          ControlRepository,
          ControlRepository,
          ControlRepository
        >
    with $Provider<ControlRepository> {
  ControlRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'controlRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$controlRepositoryHash();

  @$internal
  @override
  $ProviderElement<ControlRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ControlRepository create(Ref ref) {
    return controlRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ControlRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ControlRepository>(value),
    );
  }
}

String _$controlRepositoryHash() => r'2771d2f82f3165d8c30408d6ce7251ab24ceb05a';
