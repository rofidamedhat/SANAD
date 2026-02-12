import 'package:json_annotation/json_annotation.dart';

part 'learn_numbers_model.g.dart';

@JsonSerializable()
class LearnNumbersModel {
  final int statusCode;
  final String message;
  final NumbersPagination data;

  LearnNumbersModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LearnNumbersModel.fromJson(Map<String, dynamic> json) =>
      _$LearnNumbersModelFromJson(json);
}

// ----------------------------

@JsonSerializable()
class NumbersPagination {
  final int pageNumber;
  final int pageSize;
  final int totalRecords;
  final int totalPages;
  final List<NumberItem> data;

  NumbersPagination({
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    required this.totalPages,
    required this.data,
  });

  factory NumbersPagination.fromJson(Map<String, dynamic> json) =>
      _$NumbersPaginationFromJson(json);
}

// ----------------------------

@JsonSerializable()
class NumberItem {
  final int id;
  final int value;
  final String imageUrl;

  NumberItem({required this.id, required this.value, required this.imageUrl});

  factory NumberItem.fromJson(Map<String, dynamic> json) =>
      _$NumberItemFromJson(json);
}
