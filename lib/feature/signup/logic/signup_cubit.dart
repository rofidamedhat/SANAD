// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sanad/core/helper/shared_pref_helper.dart';
import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/core/networking/api_error_model.dart';
import 'package:sanad/core/networking/dio_factory.dart';
import 'package:sanad/feature/signup/data/model/signup_request_body.dart';
import 'package:sanad/feature/signup/data/model/signup_response_body.dart';
import 'package:sanad/feature/signup/data/repo/signup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupRepo signupRepo;
  SignupCubit(this.signupRepo) : super(SignupInitial());

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String role = " ";

  SignupResponseBody? signupResponseBody;

  void signup() async {
    emit(SignupLoading());
    try {
      signupResponseBody = await signupRepo.signup(
        SignupRequestBody(
          fullName: name.text,
          email: email.text,
          password: password.text,
          role: role,
        ),
      );

      if (signupResponseBody!.isAuthenticated) {
        String uId = JwtDecoder.decode(
          signupResponseBody!.token!,
        )['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'];
        log("user id $uId");
        await SharedPrefHelper.setData("token", signupResponseBody!.token!);
        await SharedPrefHelper.setData("uId", uId);
        await SharedPrefHelper.setData("role", signupResponseBody!.role!);
        DioFactory.setTokenIntoHeaderAfterLogin(signupResponseBody!.token!);
        await FirebaseMessaging.instance.subscribeToTopic("all_users");
        emit(SignupSuccessfully(signupResponseBody: signupResponseBody!));
      } else {
        print("Error from else ");
        emit(
          SignupWithError(message: ApiErrorHandler.handle(signupResponseBody)),
        );
      }
    } catch (error, stackTrace) {
      print("role from cubit is $role");
      print("Error from cubit is $error");
      print("Stack trace is $stackTrace");
      emit(SignupWithError(message: ApiErrorHandler.handle(error)));
    }
  }
}
