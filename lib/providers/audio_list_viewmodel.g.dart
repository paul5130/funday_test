// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_list_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AudioListViewmodel)
const audioListViewmodelProvider = AudioListViewmodelProvider._();

final class AudioListViewmodelProvider
    extends
        $AsyncNotifierProvider<AudioListViewmodel, List<AudioItemViewmodel>> {
  const AudioListViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioListViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioListViewmodelHash();

  @$internal
  @override
  AudioListViewmodel create() => AudioListViewmodel();
}

String _$audioListViewmodelHash() =>
    r'e8342a415e2c571a662c3d731f2763228fca8c68';

abstract class _$AudioListViewmodel
    extends $AsyncNotifier<List<AudioItemViewmodel>> {
  FutureOr<List<AudioItemViewmodel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<AudioItemViewmodel>>,
              List<AudioItemViewmodel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<AudioItemViewmodel>>,
                List<AudioItemViewmodel>
              >,
              AsyncValue<List<AudioItemViewmodel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
