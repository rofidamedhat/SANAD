import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/feature/signup/logic/signup_cubit.dart';
import 'package:sanad/core/extensions/navigation.dart';
import '../../../../core/constants.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themeing/colors.dart';
import '../../../../core/themeing/text_styles.dart';

class SignupButtonListen extends StatelessWidget {
  const SignupButtonListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit,SignupState>(
        listener:(context,state){
          if(state is SignupLoading){
            print("loading");
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.green69,
                ),
              ),
            );
          }
          else if(state is SignupSuccessfully){
            //TODO:context.pop() to exit from showDialog

            context.pop();
            context.pushReplacementNamed(Routes.loginScreen);
          }
          else if (state is SignupWithError){
            print("Error...");
            setupErrorState(context,state.message.message!);
          }
        },
        child:SizedBox.shrink()
    );
  }
}
