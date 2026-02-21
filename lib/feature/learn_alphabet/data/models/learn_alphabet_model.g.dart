// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_alphabet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearnAlphabetModel _$LearnAlphabetModelFromJson(Map<String, dynamic> json) =>
    LearnAlphabetModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: AlphabetPagination.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LearnAlphabetModelToJson(LearnAlphabetModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

AlphabetPagination _$AlphabetPaginationFromJson(Map<String, dynamic> json) =>
    AlphabetPagination(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalRecords: (json['totalRecords'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => AlphabetLetter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlphabetPaginationToJson(AlphabetPagination instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'totalRecords': instance.totalRecords,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

AlphabetLetter _$AlphabetLetterFromJson(Map<String, dynamic> json) =>
    AlphabetLetter(
      id: (json['id'] as num).toInt(),
      letter: json['letter'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$AlphabetLetterToJson(AlphabetLetter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'letter': instance.letter,
      'imageUrl': instance.imageUrl,
    };
