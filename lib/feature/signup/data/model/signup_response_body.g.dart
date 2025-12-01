// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseBody _$SignupResponseBodyFromJson(Map<String, dynamic> json) =>
    SignupResponseBody(
      token: json['token'] as String?,
      isAuthenticated: json['isAuthenticated'] as bool,
      role: json['role'] as String?,
      message: json['message'] as String,
    );

Map<String, dynamic> _$SignupResponseBodyToJson(SignupResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'isAuthenticated': instance.isAuthenticated,
      'role': instance.role,
    };
