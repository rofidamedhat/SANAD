import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class VideoConditionItem extends StatelessWidget {
  final IconData icon;
  final String text;
   VideoConditionItem({super.key,required this.text,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0),
      child:Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.lighterGray,
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
               Icon(
                icon,
                color: AppColors.green69,
                size: 30,
              ),
            horizontalSpace(16),
            Expanded(
              child: Text(
                text,
                style: TextStyles.font15Black05Regular,
              ),
            ),
          ],
        ),
      )
    );
  }
}
