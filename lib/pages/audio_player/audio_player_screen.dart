import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerScreen extends ConsumerStatefulWidget {
  const AudioPlayerScreen({
    super.key,
    required this.title,
    required this.assetPath,
  });
  final String title;
  final String assetPath;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends ConsumerState<AudioPlayerScreen> {
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    if (widget.assetPath.startsWith('/')) {
      player.setFilePath(widget.assetPath);
    } else {
      player.setAsset(widget.assetPath);
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FUNDAY')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title, style: TextStyle(fontSize: 40)),
            GestureDetector(
              onTap: () => player.play(),
              child: Icon(Icons.play_arrow, size: 50),
            ),
            GestureDetector(
              onTap: () => player.pause(),
              child: Icon(Icons.pause, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}
