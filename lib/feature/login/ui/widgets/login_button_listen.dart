import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/extensions/navigation.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/themeing/colors.dart';
import '../../../../core/themeing/text_styles.dart';
import '../../logic/login_cubit.dart';

class LoginButtonListen extends StatelessWidget {
  const LoginButtonListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>(
        listener:(context,state){
          if(state is LoginLoading){
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
          else if(state is LoginSuccessfully){
            //TODO:context.pop() to exit from showDialog

            context.pop();
            context.pushNamed(Routes.homeVolunteer);
          }
          else if (state is LoginWithError){
            print("Error...");
            setupErrorState(context,state.apiErrorMessage);
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
          style: TextStyles.font20Regular,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font20Regular,
            ),
          ),
        ],
      ),
    );
  }
}
