// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseBody _$LoginResponseBodyFromJson(Map<String, dynamic> json) =>
    LoginResponseBody(
      token: json['token'] as String,
      isAuthenticated: json['isAuthenticated'] as bool,
      role: json['role'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$LoginResponseBodyToJson(LoginResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'isAuthenticated': instance.isAuthenticated,
      'role': instance.role,
    };
