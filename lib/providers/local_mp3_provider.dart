import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'local_mp3_provider.g.dart';

@riverpod
Future<String?> loadLocalMp3(Ref ref, String id) async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/$id.mp3');
  if (await file.exists()) {
    return file.path;
  } else {
    return null;
  }
}
