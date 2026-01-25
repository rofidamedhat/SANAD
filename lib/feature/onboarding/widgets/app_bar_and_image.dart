import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/strings.dart';
import '../../../core/themeing/colors.dart';
import '../../../core/themeing/text_styles.dart';

class AppBarAndImage extends StatelessWidget {
  const AppBarAndImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 450.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.mainGreen,
              borderRadius:BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("مرحبا بك في",
                  style: TextStyles.font48SemiBold,
                ),
                Text("Sanad",
                  style: TextStyles.font48SemiBold,
                ),
                Text("سند",
                  style: TextStyles.font48SemiBold,
                ),
              ],
            ),
          ),
          Positioned(
            top: 350.h,
            right: 50.w,
            left: 50.w,
            child: Image.asset(onboardingImage,
            ),
          )
        ]
    );
  }
}
