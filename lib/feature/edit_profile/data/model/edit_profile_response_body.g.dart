// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileData _$EditProfileDataFromJson(Map<String, dynamic> json) =>
    EditProfileData(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
    );

Map<String, dynamic> _$EditProfileDataToJson(EditProfileData instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'role': instance.role,
      'profileImageUrl': instance.profileImageUrl,
    };

EditProfileResponseBody _$EditProfileResponseBodyFromJson(
  Map<String, dynamic> json,
) => EditProfileResponseBody(
  statusCode: (json['statusCode'] as num).toInt(),
  message: json['message'] as String,
  data: EditProfileData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EditProfileResponseBodyToJson(
  EditProfileResponseBody instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
