import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:funday_test/pages/audio_player/audio_player_screen.dart';
import 'package:funday_test/providers/download_mp3_provider.dart';
import 'package:funday_test/providers/taipei_audio_list_provider.dart';
import 'package:intl/intl.dart';

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
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      final notifier = ref.read(taipeiAudioListProvider.notifier);
      notifier.fetchMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final audioListSync = ref.watch(taipeiAudioListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('FUNDAY')),
      body: audioListSync.when(
        data: (mediaList) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: mediaList.length + 1,
            itemBuilder: (context, index) {
              if (index == mediaList.length) {
                final isLoading = audioListSync.isLoading;
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator.adaptive()
                        : const SizedBox.shrink(),
                  ),
                );
              }
              return ListTile(
                onTap: () async {
                  final localPath = await ref.read(
                    downloadMp3Provider(
                      mediaList[index].url,
                      mediaList[index].id.toString(),
                    ).future,
                  );
                  if (localPath != null) {
                    _toAudioPlayerScreen(
                      context,
                      mediaList[index].title,
                      localPath,
                    );
                  }
                  // final downloadState = ref.watch(
                  //   downloadMp3Provider(
                  //     mediaList[index].url,
                  //     mediaList[index].id.toString(),
                  //   ),
                  // );
                  // downloadState.when(
                  //   data: (path) {
                  //     debugPrint(path);
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => AudioPlayerScreen(
                  //           title: mediaList[index].title,
                  //           assetPath: path,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   error: (error, stackTrace) =>
                  //       Center(child: Text(error.toString())),
                  //   loading: () =>
                  //       const Center(child: CircularProgressIndicator()),
                  // );
                },
                title: Text(mediaList[index].title),
                trailing: Column(
                  children: [
                    // TextButton(onPressed: () {}, child: Icon(Icons.play_arrow)),
                    Text(
                      DateFormat(
                        'MM/dd HH:mm',
                      ).format(DateTime.parse(mediaList[index].modified)),
                    ),
                  ],
                ),
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
    String title,
    String localPath,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AudioPlayerScreen(title: title, assetPath: localPath),
      ),
    );
  }
}
