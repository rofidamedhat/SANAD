import 'package:json_annotation/json_annotation.dart';

import '../../../../add_question/data/model/add_post_data_model/add_post_response_data.dart';

part 'delete_post_response_body.g.dart';
@JsonSerializable()
class DeletePostResponseBody{
  final int statusCode;
  final String message;
  final List<AddPostResponseData>data;

  DeletePostResponseBody({
    required this.statusCode,
    required this.message,
    required this.data,});

  factory DeletePostResponseBody.fromJson(Map<String, dynamic> json) =>
      _$DeletePostResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$DeletePostResponseBodyToJson(this);
}