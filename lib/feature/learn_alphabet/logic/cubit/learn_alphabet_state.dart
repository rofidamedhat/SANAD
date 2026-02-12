part of 'learn_alphabet_cubit.dart';

@immutable
sealed class LearnAlphabetState {}

final class LearnAlphabetInitial extends LearnAlphabetState {}

class LearnAlphabetLoadingState extends LearnAlphabetState {}

class LearnAlphabetSuccessState extends LearnAlphabetState {
  final List<AlphabetLetter> lettersList;
  LearnAlphabetSuccessState(this.lettersList);
}

class LearnAlphabetErrorState extends LearnAlphabetState {
  final ApiErrorModel apiErrorModel;
  LearnAlphabetErrorState(this.apiErrorModel);
}
