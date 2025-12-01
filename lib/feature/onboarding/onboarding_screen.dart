import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/core/widgets/app_text_button.dart';
import 'package:sanad/feature/onboarding/widgets/app_bar_and_image.dart';
import 'package:sanad/feature/onboarding/widgets/dont_have_account_text.dart';

import '../../core/helper/strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Expanded(
           flex: 5,
             child:AppBarAndImage()),
        AppTextButton(
            buttonText: "ابدأ الرحله",
            textStyle: TextStyles.font20BaseWhiteSemiBold,
            onPressed: (){
              context.pushNamed(!isLoginUser?Routes.loginScreen
                  :isVolunteer?Routes.homeVolunteer
                  :Routes.homeDeafUser);
            },
          backgroundColor: AppColors.mainGreen,
          borderRadius: 50,
          buttonHeight: 55,
          buttonWidth: 234,
        ),
        verticalSpace(20),
         DontHaveAccountText(),
         verticalSpace(20)
       ],
     ),
    );
  }
}
