import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/helper/helper_function.dart';
import 'package:sanad/core/networking/api_error_model.dart';
import 'package:sanad/core/networking/api_result.dart';
import 'package:sanad/feature/learn_numbers/data/models/learn_numbers_model.dart';
import 'package:sanad/feature/learn_numbers/data/repos/learn_number_repo.dart';

part 'learn_number_state.dart';

class LearnNumberCubit extends Cubit<LearnNumberState> {
  final LearnNumberRepo numbersRepo;

  LearnNumberCubit(this.numbersRepo) : super(LearnNumberInitial());

  int currentPage = 1;
  int totalPages = 1;
  bool isFetching = false;
  List<NumberItem> allNumbers = [];

  Future<void> getNumbers({bool isInitial = true}) async {
    if (isFetching || (!isInitial && currentPage > totalPages)) return;

    fetchingForFirstTIme(isInitial);
    final response = await numbersRepo.getNumbers(currentPage, 10);
    if (response is Success<LearnNumbersModel>) {
      fetchingSuccess(response);
    } else if (response is Failure<LearnNumbersModel>) {
      isFetching = false;
      emit(LearnNumberErrorState(response.apiErrorModel));
    }
  }

  void fetchingSuccess(Success<LearnNumbersModel> response) {
    totalPages = response.data.data.totalPages;
    allNumbers = handlePaginationResponse(
      result: response.data.data.data,
      currentList: allNumbers,
      currentPage: currentPage,
    );
    currentPage++;
    isFetching = false;
    emit(LearnNumberSuccessState(List.from(allNumbers)));
  }

  void fetchingForFirstTIme(bool isInitial) {
    isFetching = true;
    if (isInitial) {
      currentPage = 1;
      emit(LearnNumberLoadingState());
    }
  }
}
