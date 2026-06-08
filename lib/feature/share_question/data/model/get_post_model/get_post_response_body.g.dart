// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_post_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostResponseBody _$GetPostResponseBodyFromJson(Map<String, dynamic> json) =>
    GetPostResponseBody(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => AddPostResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPostResponseBodyToJson(
  GetPostResponseBody instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
