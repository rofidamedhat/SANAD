import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/feature/add_question/data/model/add_post_response_data.dart';
part 'get_post_response_body.g.dart';
@JsonSerializable()
class GetPostResponseBody{
  final int statusCode;
  final String message;
  final List<AddPostResponseData>data;

  GetPostResponseBody({
    required this.statusCode,
    required this.message,
    required this.data,});

  factory GetPostResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetPostResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetPostResponseBodyToJson(this);
}