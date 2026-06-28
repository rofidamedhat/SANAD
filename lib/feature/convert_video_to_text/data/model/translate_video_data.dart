import 'package:json_annotation/json_annotation.dart';
part 'translate_video_data.g.dart';
@JsonSerializable()
class TranslateVideoData{

  final String sentence;
  final List<String> words;
  @JsonKey(name: 'text_direction')
  final String textDirection;
  final String language;
  @JsonKey(name: 'n_frames')
  final int nFrames;
  @JsonKey(name: 'n_valid_pose_frames')
  final int nValidPoseFrames;

  TranslateVideoData({
   required this.sentence,
    required this.words,
    required this.textDirection,
    required  this.language,
    required this.nFrames,
    required this.nValidPoseFrames,
  });

  factory TranslateVideoData.fromJson(Map<String, dynamic> json) =>
      _$TranslateVideoDataFromJson(json);

  Map<String, dynamic> toJson() => _$TranslateVideoDataToJson(this);
}