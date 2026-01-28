import 'package:flutter/material.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';

import '../../../../core/themeing/text_styles.dart';

class HelloHeroContainer extends StatelessWidget {
  const HelloHeroContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.green69,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("مستعد للانطلاق",
          style: TextStyles.font40WhiteSemiBold,
          ),
          verticalSpace(15),
          Text("يا بطل ؟!",
            style: TextStyles.font40WhiteSemiBold,
          ),
        ],
      ),
    );
  }
}
