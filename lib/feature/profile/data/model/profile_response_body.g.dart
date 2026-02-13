// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
  fullName: json['fullName'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  profileImageUrl: json['profileImageUrl'] as String,
);

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'role': instance.role,
      'profileImageUrl': instance.profileImageUrl,
    };

ProfileResponseBody _$ProfileResponseBodyFromJson(Map<String, dynamic> json) =>
    ProfileResponseBody(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: ProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseBodyToJson(
  ProfileResponseBody instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
