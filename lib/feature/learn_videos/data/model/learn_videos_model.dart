import 'package:json_annotation/json_annotation.dart';

part 'learn_videos_model.g.dart';

@JsonSerializable()
class LearnVideosModel {
  final int statusCode;
  final String message;
  final List<VideoModel> data;

  LearnVideosModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LearnVideosModel.fromJson(Map<String, dynamic> json) =>
      _$LearnVideosModelFromJson(json);
}

@JsonSerializable()
class VideoModel {
  final int id;
  final String title;

  @JsonKey(name: 'video_Url')
  final String videoUrl;

  @JsonKey(name: 'thumbnail_Url')
  final String thumbnailUrl;

  VideoModel({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.thumbnailUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
}
