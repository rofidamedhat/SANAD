import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/feature/signup/logic/signup_cubit.dart';
import 'package:sanad/core/extensions/navigation.dart';
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
                  color: AppColors.mainGreen,
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
  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font20BaseBlackRegular,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font20BaseBlackRegular,
            ),
          ),
        ],
      ),
    );
  }
}
