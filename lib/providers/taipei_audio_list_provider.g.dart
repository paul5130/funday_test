// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taipei_audio_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TaipeiAudioList)
const taipeiAudioListProvider = TaipeiAudioListProvider._();

final class TaipeiAudioListProvider
    extends $AsyncNotifierProvider<TaipeiAudioList, List<TaipeiAudio>> {
  const TaipeiAudioListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taipeiAudioListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taipeiAudioListHash();

  @$internal
  @override
  TaipeiAudioList create() => TaipeiAudioList();
}

String _$taipeiAudioListHash() => r'e0ecb07bac7e9251f5beebffd52f92e92cc21c87';

abstract class _$TaipeiAudioList extends $AsyncNotifier<List<TaipeiAudio>> {
  FutureOr<List<TaipeiAudio>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<TaipeiAudio>>, List<TaipeiAudio>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TaipeiAudio>>, List<TaipeiAudio>>,
              AsyncValue<List<TaipeiAudio>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
