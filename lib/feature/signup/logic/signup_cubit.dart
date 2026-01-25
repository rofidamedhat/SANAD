import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/core/networking/api_error_model.dart';
import 'package:sanad/feature/signup/data/model/signup_request_body.dart';
import 'package:sanad/feature/signup/data/model/signup_response_body.dart';
import 'package:sanad/feature/signup/data/repo/signup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupRepo signupRepo;
  SignupCubit(this.signupRepo) : super(SignupInitial());
  
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController name=TextEditingController();
  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  String role=" ";
  
  SignupResponseBody? signupResponseBody;
 
  void signup()async{
    
    emit(SignupLoading());
    try{
      signupResponseBody= await signupRepo.signup(
        SignupRequestBody(
            fullName: name.text,
            email: email.text,
            password: password.text,
            role: role
        )
      );
      
      if(signupResponseBody!.isAuthenticated){
        emit(SignupSuccessfully(signupResponseBody: signupResponseBody!));
      }
      else{
        print("Error from else ");
        emit(SignupWithError(message: ApiErrorHandler.handle(signupResponseBody)));
      }
    }catch(error,stackTrace){
      print("role from cubit is $role");
      print("Error from cubit is $error");
      print("Stack trace is $stackTrace");
      emit(SignupWithError(message: ApiErrorHandler.handle(error)));
      
    }
  }
}
