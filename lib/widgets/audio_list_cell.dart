import 'package:flutter/material.dart';
import 'package:funday_test/models/audio_item_viewmodel.dart';
import 'package:intl/intl.dart';

class AudioListCell extends StatefulWidget {
  const AudioListCell({
    super.key,
    required this.audioItemViewmodel,
    this.onPlay,
    this.onDownload,
  });
  final AudioItemViewmodel audioItemViewmodel;
  final VoidCallback? onPlay;
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
              GestureDetector(
                onTap: widget.audioItemViewmodel.downloadStatus.isDownloaded
                    ? widget.onPlay
                    : widget.onDownload,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        widget.audioItemViewmodel.downloadStatus.isDownloaded
                            ? Icons.play_arrow
                            : Icons.download,
                      ),
                      Text(
                        widget.audioItemViewmodel.downloadStatus.isDownloaded
                            ? '播放'
                            : '下載',
                      ),
                    ],
                  ),
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
