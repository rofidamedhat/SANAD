
import 'package:json_annotation/json_annotation.dart';
part 'add_post_response_data.g.dart';
@JsonSerializable()
class AddPostResponseData{
  final String content;
  final String userName;
  final String profileImageUrl;
  final String createdAt;
  final String createdAtText;

  AddPostResponseData({
    required this.content,
    required this.userName,
    required this.profileImageUrl,
    required this.createdAt,
    required this.createdAtText,
});
  factory AddPostResponseData.fromJson(Map<String, dynamic> json) =>
      _$AddPostResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddPostResponseDataToJson(this);
}