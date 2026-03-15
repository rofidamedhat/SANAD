// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPostResponseBody _$AddPostResponseBodyFromJson(Map<String, dynamic> json) =>
    AddPostResponseBody(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: AddPostResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddPostResponseBodyToJson(
  AddPostResponseBody instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
