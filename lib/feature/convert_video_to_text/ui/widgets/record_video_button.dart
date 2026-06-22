import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/convert_video_to_text/logic/convert_video_to_text_cubit.dart';

class RecordVideoButton extends StatelessWidget {
  const RecordVideoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: (){
        context.read<ConvertVideoToTextCubit>().recordVideoInsideApp();
      }, // الفانكشن بتاعة فتح الكاميرا فوراً
      icon: const Icon(Icons.videocam_rounded, size: 25),
      label:  Text(
        "تسجيل فيديو",
        style: TextStyles.font16WhiteMedium
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.white, // النص والأيقونة بالبنفسجي
        side:  BorderSide(color: AppColors.white, width: 1.5.w), // بردر بنفسجي شيك
        padding:  EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor:AppColors.green69,
      ),
    );
  }
}
