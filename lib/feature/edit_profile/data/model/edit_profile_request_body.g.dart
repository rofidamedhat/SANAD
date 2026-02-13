// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestBody _$EditProfileRequestBodyFromJson(
  Map<String, dynamic> json,
) => EditProfileRequestBody(
  FullName: json['FullName'] as String,
  Email: json['Email'] as String,
  Role: json['Role'] as String,
);

Map<String, dynamic> _$EditProfileRequestBodyToJson(
  EditProfileRequestBody instance,
) => <String, dynamic>{
  'FullName': instance.FullName,
  'Email': instance.Email,
  'Role': instance.Role,
};
