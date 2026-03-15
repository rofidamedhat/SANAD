import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/feature/add_question/data/model/add_post_response_data.dart';
part 'add_post_response_body.g.dart';
@JsonSerializable()
class AddPostResponseBody{
  final int statusCode;
  final String message;
  final AddPostResponseData data;

  AddPostResponseBody({
    required this.statusCode,
    required this.message,
    required this.data,
});
  factory AddPostResponseBody.fromJson(Map<String, dynamic> json) =>
      _$AddPostResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddPostResponseBodyToJson(this);
}
