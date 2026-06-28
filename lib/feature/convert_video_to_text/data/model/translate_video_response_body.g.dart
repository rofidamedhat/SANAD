// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_video_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslateVideoResponseBody _$TranslateVideoResponseBodyFromJson(
  Map<String, dynamic> json,
) => TranslateVideoResponseBody(
  statusCode: (json['statusCode'] as num).toInt(),
  message: json['message'] as String,
  data: TranslateVideoData.fromJson(json['data'] as Map<String, dynamic>),
  isSuccess: json['isSuccess'] as bool,
  errors: json['errors'],
);

Map<String, dynamic> _$TranslateVideoResponseBodyToJson(
  TranslateVideoResponseBody instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
  'isSuccess': instance.isSuccess,
  'errors': instance.errors,
};
