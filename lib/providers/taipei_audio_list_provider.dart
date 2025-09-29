import 'package:dio/dio.dart';
import 'package:funday_test/models/taipei_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'taipei_audio_list_provider.g.dart';

@riverpod
class TaipeiAudioList extends _$TaipeiAudioList {
  final _dio = Dio();
  int _currentPage = 1;
  static const _baseUrl =
      'https://www.travel.taipei/open-api/zh-tw/Media/Audio';
  static const _defaultHeaders = {'Accept': 'application/json'};
  @override
  Future<List<TaipeiAudio>> build() async {
    _currentPage = 1;
    return _fetchPage(1);
  }

  Future<List<TaipeiAudio>> _fetchPage(int page) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {'page': page},
      options: Options(headers: _defaultHeaders),
    );

    if (response.statusCode == 200) {
      final data = response.data;
      final List<dynamic> results = data['data'];
      await Future.delayed(const Duration(milliseconds: 500));
      return results
          .map((json) => TaipeiAudio.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load Taipei audio list');
    }
  }

  Future<void> fetchMore() async {
    state = AsyncLoading<List<TaipeiAudio>>().copyWithPrevious(state);
    final nextPage = _currentPage + 1;
    final previous = await future;
    try {
      final newItems = await _fetchPage(nextPage);
      _currentPage = nextPage;
      state = AsyncData([...previous, ...newItems]);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
