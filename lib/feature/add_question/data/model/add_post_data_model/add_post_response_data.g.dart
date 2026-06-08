// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPostResponseData _$AddPostResponseDataFromJson(Map<String, dynamic> json) =>
    AddPostResponseData(
      id: (json['id'] as num).toInt(),
      userId: json['userId'] as String,
      content: json['content'] as String,
      userName: json['userName'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      createdAt: json['createdAt'] as String,
      createdAtText: json['createdAtText'] as String,
    );

Map<String, dynamic> _$AddPostResponseDataToJson(
  AddPostResponseData instance,
) => <String, dynamic>{
  'content': instance.content,
  'userName': instance.userName,
  'profileImageUrl': instance.profileImageUrl,
  'createdAt': instance.createdAt,
  'createdAtText': instance.createdAtText,
  'id': instance.id,
  'userId': instance.userId,
};
