// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taipei_audio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaipeiAudio _$TaipeiAudioFromJson(Map<String, dynamic> json) => TaipeiAudio(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  url: json['url'] as String,
  modified: json['modified'] as String,
);

Map<String, dynamic> _$TaipeiAudioToJson(TaipeiAudio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'modified': instance.modified,
    };
