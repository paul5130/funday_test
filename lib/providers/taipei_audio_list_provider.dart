import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:funday_test/models/taipei_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'taipei_audio_list_provider.g.dart';

@riverpod
class TaipeiAudioList extends _$TaipeiAudioList {
  final _dio = Dio();
  static const _baseUrl =
      'https://www.travel.taipei/open-api/zh-tw/Media/Audio';
  static const _defaultHeaders = {'Accept': 'application/json'};
  @override
  Future<List<TaipeiAudio>> build() async {
    return [];
  }

  Future<List<TaipeiAudio>> fetchPage(int page) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {'page': page},
      options: Options(headers: _defaultHeaders),
    );
    debugPrint(response.realUri.toString());
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
}
