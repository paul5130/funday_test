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
  @override
  Widget build(BuildContext context) {
    final audioListSync = ref.watch(fetchTaipeiAudioListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('FUNDAY')),
      body: audioListSync.when(
        data: (mediaList) {
          return ListView.builder(
            itemCount: mediaList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () async {
                  final localPath = await ref.read(
                    downloadMp3Provider(
                      mediaList[index].url,
                      mediaList[index].id.toString(),
                    ).future,
                  );
                  if (!mounted) return;
                  if (localPath != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AudioPlayerScreen(
                          title: mediaList[index].title,
                          assetPath: localPath,
                        ),
                      ),
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
}
