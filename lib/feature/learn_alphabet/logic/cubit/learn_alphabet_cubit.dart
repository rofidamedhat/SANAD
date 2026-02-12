import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/helper/helper_function.dart';
import 'package:sanad/core/networking/api_error_model.dart';
import 'package:sanad/core/networking/api_result.dart';
import 'package:sanad/feature/learn_alphabet/data/models/learn_alphabet_model.dart';
import 'package:sanad/feature/learn_alphabet/data/repos/learn_alphabet_repo.dart';

part 'learn_alphabet_state.dart';

class LearnAlphabetCubit extends Cubit<LearnAlphabetState> {
  final LearnAlphabetRepo alphabetRepo;
  LearnAlphabetCubit(this.alphabetRepo) : super(LearnAlphabetInitial());

  int currentPage = 1;
  int totalPages = 1;
  bool isFetching = false;
  List<AlphabetLetter> allLetters = [];

  Future<void> getLetters({bool isInitial = true}) async {
    if (isFetching || (!isInitial && currentPage > totalPages)) return;

    fetchingForFirstTIme(isInitial);
    final response = await alphabetRepo.getAlphabet(currentPage, 10);
    if (response is Success<LearnAlphabetModel>) {
      fetchingSuccess(response);
    } else if (response is Failure<LearnAlphabetModel>) {
      isFetching = false;
      emit(LearnAlphabetErrorState(response.apiErrorModel));
    }
  }

  void fetchingSuccess(Success<LearnAlphabetModel> response) {
    totalPages = response.data.data.totalPages;
    allLetters = handlePaginationResponse(
      result: response.data.data.data,
      currentList: allLetters,
      currentPage: currentPage,
    );
    currentPage++;
    isFetching = false;
    emit(LearnAlphabetSuccessState(List.from(allLetters)));
  }

  void fetchingForFirstTIme(bool isInitial) {
    isFetching = true;
    if (isInitial) {
      currentPage = 1;
      emit(LearnAlphabetLoadingState());
    }
  }
}
