// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_processing_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TagProcessingNotifier)
final tagProcessingProvider = TagProcessingNotifierProvider._();

final class TagProcessingNotifierProvider
    extends $NotifierProvider<TagProcessingNotifier, Map<int, TagEvaluation>> {
  TagProcessingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagProcessingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagProcessingNotifierHash();

  @$internal
  @override
  TagProcessingNotifier create() => TagProcessingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, TagEvaluation> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, TagEvaluation>>(value),
    );
  }
}

String _$tagProcessingNotifierHash() =>
    r'791d2312225f7f6f00ca979a5325e1836fbb0739';

abstract class _$TagProcessingNotifier
    extends $Notifier<Map<int, TagEvaluation>> {
  Map<int, TagEvaluation> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<Map<int, TagEvaluation>, Map<int, TagEvaluation>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<int, TagEvaluation>, Map<int, TagEvaluation>>,
              Map<int, TagEvaluation>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
