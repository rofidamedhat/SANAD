import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/extensions/navigation.dart';

import '../../../../core/constants.dart';
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
                  color: AppColors.green69,
                ),
              ),
            );
          }
          else if(state is LoginSuccessfully){
            //TODO:context.pop() to exit from showDialog

            context.pop();
            print(state.loginResponseBody.role);
            state.loginResponseBody.role=="Volunteer"?
            context.pushReplacementNamed(Routes.homeVolunteer):
            context.pushReplacementNamed(Routes.homeDeafUser);
          }
          else if (state is LoginWithError){
            print("Error...");
            setupErrorState(context,state.apiErrorMessage.message!);
          }
        },
        child:SizedBox.shrink()
    );
  }

}
