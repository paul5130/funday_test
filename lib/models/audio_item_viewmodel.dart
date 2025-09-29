import 'package:funday_test/models/download_status.dart';
import 'package:funday_test/models/taipei_audio.dart';

class AudioItemViewmodel {
  final TaipeiAudio taipeiAudio;
  final DownloadStatus downloadStatus;
  AudioItemViewmodel({required this.taipeiAudio, required this.downloadStatus});

  AudioItemViewmodel copyWith({
    TaipeiAudio? taipeiAudio,
    DownloadStatus? downloadStatus,
  }) {
    return AudioItemViewmodel(
      taipeiAudio: taipeiAudio ?? this.taipeiAudio,
      downloadStatus: downloadStatus ?? this.downloadStatus,
    );
  }
}
