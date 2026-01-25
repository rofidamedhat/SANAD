import 'package:flutter/material.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ليس لديك حساب ؟  ",
        style: TextStyles.font20Regular,
        ),
        GestureDetector(
          onTap: (){
            context.pushNamed(Routes.signUpScreen);
          },
          child: Text("اضافة حساب",
            style: TextStyles.font20Bold,
          ),
        ),
      ],
    );
  }
}
