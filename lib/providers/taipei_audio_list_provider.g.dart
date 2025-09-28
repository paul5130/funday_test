// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taipei_audio_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchTaipeiAudioList)
const fetchTaipeiAudioListProvider = FetchTaipeiAudioListProvider._();

final class FetchTaipeiAudioListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TaipeiAudio>>,
          List<TaipeiAudio>,
          FutureOr<List<TaipeiAudio>>
        >
    with
        $FutureModifier<List<TaipeiAudio>>,
        $FutureProvider<List<TaipeiAudio>> {
  const FetchTaipeiAudioListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchTaipeiAudioListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchTaipeiAudioListHash();

  @$internal
  @override
  $FutureProviderElement<List<TaipeiAudio>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TaipeiAudio>> create(Ref ref) {
    return fetchTaipeiAudioList(ref);
  }
}

String _$fetchTaipeiAudioListHash() =>
    r'09d93e21603f6b2ecffb08368b4710b31be44d69';
