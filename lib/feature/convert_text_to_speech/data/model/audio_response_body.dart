import 'package:json_annotation/json_annotation.dart';
part 'audio_response_body.g.dart';

@JsonSerializable()
class AudioResponseBody {
  final String message;
  final int statusCode;
  final String data;
  AudioResponseBody({
    required this.message,
    required this.statusCode,
    required this.data

  });

  factory AudioResponseBody.fromJson(Map<String, dynamic> json) =>
      _$AudioResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AudioResponseBodyToJson(this);
}