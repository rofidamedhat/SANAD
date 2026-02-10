// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioResponseBody _$AudioResponseBodyFromJson(Map<String, dynamic> json) =>
    AudioResponseBody(
      message: json['message'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      data: json['data'] as String,
    );

Map<String, dynamic> _$AudioResponseBodyToJson(AudioResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };
