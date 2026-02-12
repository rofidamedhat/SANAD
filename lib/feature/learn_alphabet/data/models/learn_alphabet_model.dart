import 'package:json_annotation/json_annotation.dart';

part 'learn_alphabet_model.g.dart';

@JsonSerializable()
class LearnAlphabetModel {
  final int statusCode;
  final String message;
  final AlphabetPagination data;

  LearnAlphabetModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LearnAlphabetModel.fromJson(Map<String, dynamic> json) =>
      _$LearnAlphabetModelFromJson(json);
}

// ----------------------------

@JsonSerializable()
class AlphabetPagination {
  final int pageNumber;
  final int pageSize;
  final int totalRecords;
  final int totalPages;
  final List<AlphabetLetter> data;

  AlphabetPagination({
    required this.pageNumber,
    required this.pageSize,
    required this.totalRecords,
    required this.totalPages,
    required this.data,
  });

  factory AlphabetPagination.fromJson(Map<String, dynamic> json) =>
      _$AlphabetPaginationFromJson(json);
}

@JsonSerializable()
class AlphabetLetter {
  final int id;
  final String letter;
  final String imageUrl;

  AlphabetLetter({
    required this.id,
    required this.letter,
    required this.imageUrl,
  });

  factory AlphabetLetter.fromJson(Map<String, dynamic> json) =>
      _$AlphabetLetterFromJson(json);
}
