import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sanad/core/helper/shared_pref_helper.dart';
import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/core/networking/api_error_model.dart';
import 'package:sanad/core/networking/dio_factory.dart';
import 'package:sanad/feature/login/data/model/login_request_body.dart';
import 'package:sanad/feature/login/data/model/login_response_body.dart';
import 'package:sanad/feature/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
 final  formKey=GlobalKey<FormState>();
  LoginResponseBody? loginResponse;

  void login(LoginRequestBody loginRequestBody)async{
    emit( LoginLoading());
    try{
   loginResponse = await loginRepo.login(loginRequestBody);
    if(loginResponse!.isAuthenticated==true){
      await SharedPrefHelper.setData("token", loginResponse!.token!);
      await SharedPrefHelper.setData("role", loginResponse!.role!);
      DioFactory.setTokenIntoHeaderAfterLogin(loginResponse!.token!);
      
      emit(LoginSuccessfully(loginResponseBody: loginResponse!));
    }
    else{
      print("Error from response ${loginResponse!.message}");
      emit(LoginWithError(apiErrorMessage:ApiErrorHandler.handle(loginResponse)));
    }
    }catch(error,stackTrace){
      print("Error from cubit is $error");
      print(stackTrace);
      emit(LoginWithError(apiErrorMessage: ApiErrorHandler.handle(error)));
    }
  }
}
