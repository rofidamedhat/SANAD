import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class SelectVideoButton extends StatelessWidget {
  const SelectVideoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed:(){}, //_pickVideoFromGallery,
      icon:  Icon(Icons.drive_folder_upload_rounded, size: 25,color: AppColors.green69,),
      label:  Text(
        "اختيار فيديو",
        style:TextStyles.font16Green69Medium,
      ),
      style: ElevatedButton.styleFrom(
        //backgroundColor: AppColors.green69,
        foregroundColor: Colors.white,
        side: BorderSide(color: AppColors.grayC1, width: 1.5.w),
        padding:  EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
    );
  }
}
