import 'package:flutter/material.dart';
import 'package:funday_test/models/audio_item_viewmodel.dart';
import 'package:funday_test/models/download_status.dart';
import 'package:intl/intl.dart';

class AudioListCell extends StatefulWidget {
  const AudioListCell({
    super.key,
    required this.audioItemViewmodel,
    this.onPlay,
    this.onDownload,
  });
  final AudioItemViewmodel audioItemViewmodel;
  final Function(String?)? onPlay;
  final VoidCallback? onDownload;
  @override
  State<AudioListCell> createState() => _AudioListCellState();
}

class _AudioListCellState extends State<AudioListCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              widget.audioItemViewmodel.taipeiAudio.title,
              style: TextStyle(fontSize: 20),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Column(
            children: [
              widget.audioItemViewmodel.downloadStatus.when(
                notDownloaded: () => GestureDetector(
                  onTap: widget.onDownload,
                  child: Row(
                    children: [
                      Icon(Icons.download),
                      Text('下載', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                downloading: () => Row(
                  children: [
                    CircularProgressIndicator.adaptive(strokeWidth: 2),
                    Text('下載中', style: TextStyle(fontSize: 16)),
                  ],
                ),
                downloaded: (filePath) => GestureDetector(
                  onTap: () => widget.onPlay!(filePath),
                  child: Row(children: [Icon(Icons.play_arrow), Text('播放')]),
                ),
                error: (message) => GestureDetector(
                  onTap: widget.onDownload,
                  child: Row(children: [Icon(Icons.download)]),
                ),
              ),
              Text(
                DateFormat('MM/dd HH:mm').format(
                  DateTime.parse(
                    widget.audioItemViewmodel.taipeiAudio.modified,
                  ),
                ),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
