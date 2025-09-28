import 'package:dio/dio.dart';
import 'package:funday_test/models/taipei_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'taipei_audio_list_provider.g.dart';

@riverpod
Future<List<TaipeiAudio>> fetchTaipeiAudioList(Ref ref) async {
  final dio = Dio();
  final response = await dio.get(
    'https://www.travel.taipei/open-api/zh-tw/Media/Audio',
    queryParameters: {'page': 1},
    options: Options(headers: {'Accept': 'application/json'}),
  );

  if (response.statusCode == 200) {
    final data = response.data;
    final List<dynamic> results = data['data'];
    return results
        .map((json) => TaipeiAudio.fromJson(json as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Failed to load Taipei audio list');
  }
}
