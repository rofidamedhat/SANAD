// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_video_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslateVideoData _$TranslateVideoDataFromJson(Map<String, dynamic> json) =>
    TranslateVideoData(
      sentence: json['sentence'] as String,
      words: (json['words'] as List<dynamic>).map((e) => e as String).toList(),
      textDirection: json['text_direction'] as String,
      language: json['language'] as String,
      nFrames: (json['n_frames'] as num).toInt(),
      nValidPoseFrames: (json['n_valid_pose_frames'] as num).toInt(),
    );

Map<String, dynamic> _$TranslateVideoDataToJson(TranslateVideoData instance) =>
    <String, dynamic>{
      'sentence': instance.sentence,
      'words': instance.words,
      'text_direction': instance.textDirection,
      'language': instance.language,
      'n_frames': instance.nFrames,
      'n_valid_pose_frames': instance.nValidPoseFrames,
    };
