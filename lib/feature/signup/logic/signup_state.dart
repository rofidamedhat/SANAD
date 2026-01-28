part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

class SignupLoading extends SignupState{}
class SignupWithError extends SignupState{

  ApiErrorModel message;

  SignupWithError({required this.message});
}

class SignupSuccessfully extends SignupState{

  SignupResponseBody signupResponseBody;

  SignupSuccessfully({required this.signupResponseBody});
}
