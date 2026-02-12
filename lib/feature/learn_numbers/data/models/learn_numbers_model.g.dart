// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_numbers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearnNumbersModel _$LearnNumbersModelFromJson(Map<String, dynamic> json) =>
    LearnNumbersModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: NumbersPagination.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LearnNumbersModelToJson(LearnNumbersModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

NumbersPagination _$NumbersPaginationFromJson(Map<String, dynamic> json) =>
    NumbersPagination(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalRecords: (json['totalRecords'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => NumberItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NumbersPaginationToJson(NumbersPagination instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'totalRecords': instance.totalRecords,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

NumberItem _$NumberItemFromJson(Map<String, dynamic> json) => NumberItem(
  id: (json['id'] as num).toInt(),
  value: (json['value'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$NumberItemToJson(NumberItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'imageUrl': instance.imageUrl,
    };
