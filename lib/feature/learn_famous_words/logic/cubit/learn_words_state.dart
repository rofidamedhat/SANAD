part of 'learn_words_cubit.dart';

@immutable
sealed class LearnWordsState {}

final class LearnWordsInitial extends LearnWordsState {}

class LearnWordsLoadingState extends LearnWordsState {}

class LearnWordsSuccessState extends LearnWordsState {
  final List<WordItem> wordsList;
  LearnWordsSuccessState(this.wordsList);
}

class LearnWordsErrorState extends LearnWordsState {
  final ApiErrorModel apiErrorModel;
  LearnWordsErrorState(this.apiErrorModel);
}
