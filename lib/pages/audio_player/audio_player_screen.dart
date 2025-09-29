import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({
    super.key,
    required this.title,
    required this.assetPath,
  });
  final String title;
  final String assetPath;
  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer player;
  bool isPlaying = false;
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
              onTap: () {
                if (isPlaying) {
                  player.pause();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  player.play();
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
              child: Icon(isPlaying ? Icons.pause : Icons.play_arrow, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}
