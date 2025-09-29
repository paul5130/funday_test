class DownloadStatus {
  final bool isDownloaded;
  final double progress;
  final String? filePath;

  DownloadStatus({
    required this.isDownloaded,
    this.progress = 0.0,
    this.filePath,
  });

  DownloadStatus copyWith({
    bool? isDownloaded,
    double? progress,
    String? filePath,
  }) {
    return DownloadStatus(
      isDownloaded: isDownloaded ?? this.isDownloaded,
      progress: progress ?? this.progress,
      filePath: filePath ?? this.filePath,
    );
  }
}
