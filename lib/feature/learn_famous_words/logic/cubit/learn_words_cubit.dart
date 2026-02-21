import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/networking/api_error_model.dart';
import 'package:sanad/feature/learn_famous_words/data/models/learn_words_model.dart';
import 'package:sanad/feature/learn_famous_words/data/repo/learn_words_repo.dart';

import '../../../../core/networking/api_result.dart';

part 'learn_words_state.dart';

class LearnWordsCubit extends Cubit<LearnWordsState> {
  final LearnWordsRepo wordsRepo;

  LearnWordsCubit(this.wordsRepo) : super(LearnWordsInitial());

  int currentPage = 1;
  int totalPages = 1;
  bool isFetching = false;
  List<WordItem> allWords = [];

 Future<void> getWords({bool isInitial = true}) async {
  print("--- Start getWords (isInitial: $isInitial) ---");
  if (isFetching || (!isInitial && currentPage > totalPages)) {
    print("--- Request Blocked: isFetching=$isFetching, page=$currentPage, total=$totalPages ---");
    return;
  }

  fetchingForFirstTIme(isInitial);
  
  print("--- Calling API for page: $currentPage ---");
  
  try {
    final response = await wordsRepo.getWords(currentPage, 10);
    
    if (response is Success<LearnWordsModel>) {
      print("--- API Success: Received ${response.data.data.data.length} items ---");
      fetchingSuccess(response);
    } else if (response is Failure<LearnWordsModel>) {
      print("--- API Failure: ${response.apiErrorModel.message} ---");
      isFetching = false;
      emit(LearnWordsErrorState(response.apiErrorModel));
    }
  } catch (e) {
    print("--- Crash in getWords: $e ---");
    isFetching = false;
    emit(LearnWordsErrorState(ApiErrorModel(message: e.toString())));
  }
}

  void fetchingSuccess(Success<LearnWordsModel> response) {
    totalPages = response.data.data.totalPages;

    // بديل مؤقت للهيلبر عشان نتأكد إن المشكلة مش فيها
    final newItems = response.data.data.data;
    allWords.addAll(newItems);

    currentPage++;
    isFetching = false;
    emit(LearnWordsSuccessState(List.from(allWords)));
  }
  // void fetchingSuccess(Success<LearnWordsModel> response) {
  //   totalPages = response.data.data.totalPages;
  //   allWords = handlePaginationResponse(
  //     result: response.data.data.data,
  //     currentList: allWords,
  //     currentPage: currentPage,
  //   );
  //   currentPage++;
  //   isFetching = false;
  //   emit(LearnWordsSuccessState(List.from(allWords)));
  // }

  void fetchingForFirstTIme(bool isInitial) {
    isFetching = true;
    if (isInitial) {
      currentPage = 1;
      emit(LearnWordsLoadingState());
    }
  }
}
