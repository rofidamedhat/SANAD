import 'package:json_annotation/json_annotation.dart';

part 'profile_response_body.g.dart';

@JsonSerializable()
class ProfileData {
  final String fullName;
  final String email;
  final String role;
  final String profileImageUrl;

  ProfileData({
    required this.fullName,
    required this.email,
    required this.role,
    required this.profileImageUrl,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}

@JsonSerializable()
class ProfileResponseBody {
  final int statusCode;
  final String message;
  final ProfileData data;

  ProfileResponseBody({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ProfileResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseBodyToJson(this);
}