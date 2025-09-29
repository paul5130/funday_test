import 'package:freezed_annotation/freezed_annotation.dart';
part 'download_status.freezed.dart';

@freezed
sealed class DownloadStatus with _$DownloadStatus {
  const DownloadStatus._();
  const factory DownloadStatus.notDownloaded() = DownloadStatusNotDownloaded;
  const factory DownloadStatus.downloading() = DownloadStatusDownloading;
  const factory DownloadStatus.downloaded({required String filePath}) =
      DownloadStatusDownloaded;
  const factory DownloadStatus.error({String? message}) = DownloadStatusFailed;
  bool get isDownloaded => switch (this) {
    final DownloadStatusDownloaded _ => true,
    _ => false,
  };
}
