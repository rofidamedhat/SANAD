import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/feature/convert_video_to_text/data/model/translate_video_data.dart';
part 'translate_video_response_body.g.dart';
@JsonSerializable()
class TranslateVideoResponseBody{
  final int statusCode;
  final String message;
  final TranslateVideoData data;
  final bool isSuccess;
  final dynamic errors;

  TranslateVideoResponseBody({
   required this.statusCode,
    required this.message,
    required this.data,
    required this.isSuccess,
    required this.errors,
  });
  factory TranslateVideoResponseBody.fromJson(Map<String, dynamic> json) =>
      _$TranslateVideoResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$TranslateVideoResponseBodyToJson(this);
}