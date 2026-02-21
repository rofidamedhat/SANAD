// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_videos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearnVideosModel _$LearnVideosModelFromJson(Map<String, dynamic> json) =>
    LearnVideosModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LearnVideosModelToJson(LearnVideosModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  videoUrl: json['video_Url'] as String,
  thumbnailUrl: json['thumbnail_Url'] as String,
);

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'video_Url': instance.videoUrl,
      'thumbnail_Url': instance.thumbnailUrl,
    };
