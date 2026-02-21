// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signalr_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signalRService)
final signalRServiceProvider = SignalRServiceProvider._();

final class SignalRServiceProvider
    extends $FunctionalProvider<SignalRService, SignalRService, SignalRService>
    with $Provider<SignalRService> {
  SignalRServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signalRServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signalRServiceHash();

  @$internal
  @override
  $ProviderElement<SignalRService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignalRService create(Ref ref) {
    return signalRService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignalRService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignalRService>(value),
    );
  }
}

String _$signalRServiceHash() => r'1bc45b430f5e75d4e0a4f3e175ca07849aa9ed9b';
