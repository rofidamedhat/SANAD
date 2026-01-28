import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class DeafWelcomeContainer extends StatelessWidget {
  const DeafWelcomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 210.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 165.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.green69,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'مرحبا بك \n يا بطل ',
                  style: TextStyles.font20WhiteSemiBold,
                ),
                verticalSpace(10),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    'تواصل الآن',
                    style: TextStyles.font22Black05Reguler,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: -50,

            child: Image.asset(
              'assets/images/deaf_welcome_image.png',
              height: 220.h,
            ),
          ),
        ],
      ),
    );
  }
}
