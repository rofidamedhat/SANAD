import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response_body.g.dart';

@JsonSerializable()
class EditProfileData {
  final String fullName;
  final String email;
  final String role;
  final String profileImageUrl;

  EditProfileData({
    required this.fullName,
    required this.email,
    required this.role,
    required this.profileImageUrl,
  });

  factory EditProfileData.fromJson(Map<String, dynamic> json) =>
      _$EditProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileDataToJson(this);
}

@JsonSerializable()
class EditProfileResponseBody {
  final int statusCode;
  final String message;
  final EditProfileData data;

  EditProfileResponseBody({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory EditProfileResponseBody.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseBodyToJson(this);
}