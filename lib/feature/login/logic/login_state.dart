part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}

class LoginSuccessfully extends LoginState{

  LoginResponseBody loginResponseBody;

  LoginSuccessfully({required this.loginResponseBody});
}

class LoginWithError extends LoginState{

  String apiErrorMessage;

  LoginWithError({required this.apiErrorMessage});
}