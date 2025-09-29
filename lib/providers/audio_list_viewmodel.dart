import 'package:funday_test/models/download_status.dart';
import 'package:funday_test/models/taipei_audio.dart';
import 'package:funday_test/providers/download_mp3_provider.dart';
import 'package:funday_test/providers/is_downloaded_provider.dart';
import 'package:funday_test/providers/taipei_audio_list_provider.dart';
import 'package:funday_test/models/audio_item_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_list_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class AudioListViewmodel extends _$AudioListViewmodel {
  int _currentPage = 1;
  bool isLoading = false;
  bool hasMore = true;
  @override
  Future<List<AudioItemViewmodel>> build() async {
    return await _fetchPage(_currentPage);
  }

  Future<List<AudioItemViewmodel>> _fetchPage(int page) async {
    final notifier = ref.read(taipeiAudioListProvider.notifier);
    final audios = await notifier.fetchPage(page);
    return Future.wait(
      audios.map((audio) async {
        final filePath = await ref.read(
          isDownloadedProvider(audio.id.toString()).future,
        );
        return AudioItemViewmodel(
          taipeiAudio: audio,
          downloadStatus: filePath != null
              ? DownloadStatus.downloaded(filePath: filePath)
              : DownloadStatus.notDownloaded(),
        );
      }),
    );
  }

  Future<void> fetchMore() async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    final previousItems = state.value ?? [];
    try {
      _currentPage++;
      final newItems = await _fetchPage(_currentPage);
      state = AsyncData(previousItems + newItems);
      hasMore = newItems.isNotEmpty;
    } catch (e, st) {
      state = AsyncError(e, st);
    } finally {
      isLoading = false;
    }
  }

  Future<void> downloadAudio(TaipeiAudio taipeiAudio) async {
    state = AsyncData([
      for (final item in state.value ?? [])
        if (item.taipeiAudio.id == taipeiAudio.id)
          item.copyWith(downloadStatus: DownloadStatus.downloading())
        else
          item,
    ]);
    try {
      final filePath = await ref.read(
        downloadMp3Provider(taipeiAudio.url, taipeiAudio.id.toString()).future,
      );
      if (!ref.mounted) return;
      state = AsyncData([
        for (final item in state.value ?? [])
          if (item.taipeiAudio.id == taipeiAudio.id)
            item.copyWith(
              downloadStatus: DownloadStatus.downloaded(filePath: filePath!),
            )
          else
            item,
      ]);
    } catch (e) {
      if (!ref.mounted) return;
      state = AsyncData([
        for (final item in state.value ?? [])
          if (item.taipeiAudio.id == taipeiAudio.id)
            item.copyWith(
              DownloadStatus.error(message: 'Failed to download audio'),
            )
          else
            item,
      ]);
    }
  }
}
