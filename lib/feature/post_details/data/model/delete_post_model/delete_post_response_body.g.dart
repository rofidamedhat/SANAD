// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_post_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletePostResponseBody _$DeletePostResponseBodyFromJson(
  Map<String, dynamic> json,
) => DeletePostResponseBody(
  statusCode: (json['statusCode'] as num).toInt(),
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => AddPostResponseData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DeletePostResponseBodyToJson(
  DeletePostResponseBody instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
