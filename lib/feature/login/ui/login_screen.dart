import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/core/widgets/app_text_button.dart';
import 'package:sanad/core/widgets/app_text_form_field.dart';
import 'package:sanad/feature/login/ui/widgets/email_and_password_validate.dart';
import 'package:sanad/feature/login/ui/widgets/hello_hero_container.dart';
import 'package:sanad/feature/login/ui/widgets/login_button_listen.dart';
import 'package:sanad/feature/onboarding/widgets/dont_have_account_text.dart';

import '../data/model/login_request_body.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HelloHeroContainer(),
            verticalSpace(100),
           EmailAndPasswordValidator(),
            verticalSpace(40),
           AppTextButton(
               buttonText: "ابدأ الرحلة",
               textStyle: TextStyles.font20BaseWhiteSemiBold,
               onPressed: (){
                 if (context
                     .read<LoginCubit>()
                     .formKey
                     .currentState!
                     .validate()) {
                   context.read<LoginCubit>().login(
                     LoginRequestBody(
                       password: context
                           .read<LoginCubit>()
                           .passwordController
                           .text,
                       email: context
                           .read<LoginCubit>()
                           .emailController
                           .text,
                     ),
                   );
                 }
               },
             borderRadius:50,
             buttonWidth: 234.w,
             buttonHeight: 55.h,
             backgroundColor: AppColors.mainGreen,
           ),
            verticalSpace(15),
            DontHaveAccountText(),
            LoginButtonListen(),
          ],
        ),
      ),
    );
  }
}
