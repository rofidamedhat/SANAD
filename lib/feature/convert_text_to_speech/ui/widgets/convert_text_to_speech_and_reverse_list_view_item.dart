import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class ConvertTextToSpeechAndReverseListViewItem extends StatelessWidget {
  final String data;
  final int index;
  final int selectedIndex;
   ConvertTextToSpeechAndReverseListViewItem({super.key,
   required this.data,
     required this.index,
     required this.selectedIndex,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      decoration: BoxDecoration(
        boxShadow:  [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
        color: index==selectedIndex?AppColors.greenA4:AppColors.gray,
        borderRadius: BorderRadius.circular(25),
        border: BoxBorder.all(
          color: index==selectedIndex?AppColors.gray:AppColors.greenA4,
          width: 1.w
        )
      ),
      child: Center(
        child: Text(data,
         style: index==selectedIndex?TextStyles.font16WhiteMedium:TextStyles.font16Black05Medium,
        ),
      ),
    );
  }
}
