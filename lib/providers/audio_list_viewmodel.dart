import 'package:funday_test/models/download_status.dart';
import 'package:funday_test/models/taipei_audio.dart';
import 'package:funday_test/providers/download_mp3_provider.dart';
import 'package:funday_test/providers/is_downloaded_provider.dart';
import 'package:funday_test/providers/taipei_audio_list_provider.dart';
import 'package:funday_test/models/audio_item_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_list_viewmodel.g.dart';

@riverpod
class AudioListViewmodel extends _$AudioListViewmodel {
  @override
  Future<List<AudioItemViewmodel>> build() async {
    final audios = await ref.watch(taipeiAudioListProvider.future);

    return Future.wait(
      audios.map((audio) async {
        final filePath = await ref.watch(
          isDownloadedProvider(audio.id.toString()).future,
        );
        return AudioItemViewmodel(
          taipeiAudio: audio,
          downloadStatus: DownloadStatus(
            isDownloaded: filePath != null,
            filePath: filePath,
          ),
        );
      }),
    );
  }

  Future<void> downloadAudio(TaipeiAudio taipeiAudio) async {
    // 1. Update the item's downloadStatus to downloading (progress 0.0)
    state = AsyncData([
      for (final item in state.value ?? [])
        if (item.taipeiAudio.id == taipeiAudio.id)
          item.copyWith(
            // downloadStatus: DownloadStatus.downloading(progress: 0.0),
          )
        else
          item,
    ]);
    try {
      // 2. Call downloadMp3Provider to download
      final filePath = await ref.read(
        downloadMp3Provider(taipeiAudio.url, taipeiAudio.id.toString()).future,
      );
      // 3. On success, update the item's status to downloaded with filePath
      state = AsyncData([
        for (final item in state.value ?? [])
          if (item.taipeiAudio.id == taipeiAudio.id)
            item.copyWith(
              downloadStatus: DownloadStatus(
                isDownloaded: true,
                filePath: filePath,
              ),
            )
          else
            item,
      ]);
    } catch (e) {
      // 4. On error, reset the item's status to not downloaded
      state = AsyncData([
        for (final item in state.value ?? [])
          if (item.taipeiAudio.id == taipeiAudio.id)
            item.copyWith(
              downloadStatus: DownloadStatus(
                isDownloaded: false,
                filePath: null,
              ),
            )
          else
            item,
      ]);
    }
  }
}
