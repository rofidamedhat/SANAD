// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_words_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearnWordsModel _$LearnWordsModelFromJson(Map<String, dynamic> json) =>
    LearnWordsModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: WordsPagination.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LearnWordsModelToJson(LearnWordsModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

WordsPagination _$WordsPaginationFromJson(Map<String, dynamic> json) =>
    WordsPagination(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalRecords: (json['totalRecords'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => WordItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WordsPaginationToJson(WordsPagination instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'totalRecords': instance.totalRecords,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

WordItem _$WordItemFromJson(Map<String, dynamic> json) => WordItem(
  id: (json['id'] as num).toInt(),
  word: json['word'] as String,
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$WordItemToJson(WordItem instance) => <String, dynamic>{
  'id': instance.id,
  'word': instance.word,
  'imageUrl': instance.imageUrl,
};
