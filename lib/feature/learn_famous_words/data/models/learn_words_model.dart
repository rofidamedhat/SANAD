import 'package:json_annotation/json_annotation.dart';

part 'learn_words_model.g.dart';

@JsonSerializable()
class LearnWordsModel {
  final int statusCode;
  final String message;
  final WordsPagination data;

  LearnWordsModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LearnWordsModel.fromJson(Map<String, dynamic> json) =>
      _$LearnWordsModelFromJson(json);
}

// ----------------------------

@JsonSerializable()
class WordsPagination {
  final int pageNumber;
  final int pageSize;
  final int totalRecords;
  final int totalPages;
  final List<WordItem> data;

  WordsPagination({
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    required this.totalPages,
    required this.data,
  });

  factory WordsPagination.fromJson(Map<String, dynamic> json) =>
      _$WordsPaginationFromJson(json);
}

// ----------------------------

@JsonSerializable()
class WordItem {
  final int id;
  final String word;
  final String imageUrl;

  WordItem({required this.id, required this.word, required this.imageUrl});

  factory WordItem.fromJson(Map<String, dynamic> json) =>
      _$WordItemFromJson(json);
}
