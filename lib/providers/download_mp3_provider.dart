import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'download_mp3_provider.g.dart';

@riverpod
Future<String?> downloadMp3(Ref ref, String url, String id) async {
  final dio = Dio();
  try {
    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/$id.mp3';
    debugPrint('filePath: $filePath');
    await dio.download(
      url,
      filePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          debugPrint((received / total * 100).toString());
        }
      },
    );
    return filePath;
  } catch (e) {
    debugPrint(e.toString());
    return '';
  }
}
