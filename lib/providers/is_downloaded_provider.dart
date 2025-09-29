import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_downloaded_provider.g.dart';

@riverpod
Future<String?> isDownloaded(Ref ref, String id) async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/$id.mp3');
  return await file.exists() ? file.path : null;
}
