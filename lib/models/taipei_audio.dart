import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'taipei_audio.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class TaipeiAudio extends Equatable {
  const TaipeiAudio({
    required this.id,
    required this.title,
    required this.url,
    required this.modified,
  });
  final int id;
  final String title;
  final String url;
  final String modified;

  factory TaipeiAudio.fromJson(Map<String, dynamic> json) =>
      _$TaipeiAudioFromJson(json);

  Map<String, dynamic> toJson() => _$TaipeiAudioToJson(this);

  @override
  List<Object?> get props => [id, title, url, modified];
}
