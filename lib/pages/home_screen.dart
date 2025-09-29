import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:funday_test/models/taipei_audio.dart';
import 'package:funday_test/pages/audio_player/audio_player_screen.dart';
import 'package:funday_test/providers/audio_list_viewmodel.dart';
import 'package:funday_test/widgets/audio_list_cell.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxExtent = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;
    if (current > maxExtent - 100) {
      final notifier = ref.read(audioListViewmodelProvider.notifier);
      if (!notifier.isLoading && notifier.hasMore) {
        notifier.fetchMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final audioViewModelListSync = ref.watch(audioListViewmodelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('FUNDAY')),
      body: audioViewModelListSync.when(
        data: (audioViewModelList) {
          return ListView.builder(
            controller: _scrollController,
            itemCount:
                audioViewModelList.length +
                (ref.read(audioListViewmodelProvider.notifier).hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == audioViewModelList.length) {
                final isLoading = audioViewModelListSync.isLoading;
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator.adaptive()
                        : const SizedBox.shrink(),
                  ),
                );
              }
              return AudioListCell(
                audioItemViewmodel: audioViewModelList[index],
                onPlay: (filePath) => _toAudioPlayerScreen(
                  context,
                  audioViewModelList[index].taipeiAudio,
                  filePath,
                ),
                onDownload: () => ref
                    .read(audioListViewmodelProvider.notifier)
                    .downloadAudio(audioViewModelList[index].taipeiAudio),
              );
            },
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void _toAudioPlayerScreen(
    BuildContext context,
    TaipeiAudio taipeiAudio,
    String? localPath,
  ) {
    if (localPath == null) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AudioPlayerScreen(title: taipeiAudio.title, assetPath: localPath),
      ),
    );
  }
}
