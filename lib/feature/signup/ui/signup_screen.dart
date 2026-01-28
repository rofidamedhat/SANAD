import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/core/widgets/app_text_button.dart';
import 'package:sanad/feature/signup/logic/signup_cubit.dart';
import 'package:sanad/feature/signup/ui/widgets/app_bar_container.dart';
import 'package:sanad/feature/signup/ui/widgets/name_and_email_and_password_validator.dart';
import 'package:sanad/feature/signup/ui/widgets/signup_button_listen.dart';
import 'package:sanad/feature/signup/ui/widgets/volunteer_and_deaf_user_radio_button.dart';

import '../../../core/themeing/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarContainer(),
            verticalSpace(50),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 30.w),
              child:NameAndEmailAndPasswordValidator()
            ),
            verticalSpace(40),
            VolunteerAndDeafUserRadioButton(),
            verticalSpace(40),
            AppTextButton(
                buttonText: "ابدأ الرحلة"
                , textStyle: TextStyles.font24WhiteRegular,
                onPressed: (){
               if(context.read<SignupCubit>().formKey.currentState!.validate()){
                 context.read<SignupCubit>().signup();
               }
                },
              borderRadius:50,
              buttonWidth: 234.w,
              buttonHeight: 55.h,
              backgroundColor: AppColors.green69,
            ),
            SignupButtonListen(),
          ],
        ),
      )
    );
  }
}
