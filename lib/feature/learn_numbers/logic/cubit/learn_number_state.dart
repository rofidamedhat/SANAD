part of 'learn_number_cubit.dart';

@immutable
sealed class LearnNumberState {}

final class LearnNumberInitial extends LearnNumberState {}

class LearnNumberLoadingState extends LearnNumberState {}

class LearnNumberSuccessState extends LearnNumberState {
  final List<NumberItem> numbersList;
  LearnNumberSuccessState(this.numbersList);
}

class LearnNumberErrorState extends LearnNumberState {
  final ApiErrorModel apiErrorModel;
  LearnNumberErrorState(this.apiErrorModel);
}
