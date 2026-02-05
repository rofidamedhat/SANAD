import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/helper/font_weight_helper.dart';
import 'package:sanad/core/themeing/colors.dart';

// -----------------------------------------------------------------------------
// الملف ده مسؤول إنه يجمع كل الـ TextStyles اللي بنستخدمها في الأبلكيشن
// في مكان واحد بس.
//
// ليه بنعمل كده؟
// - عشان نخلي شكل الخطوط والألوان موحّد في كل الصفحات.
// - بدل ما نكرر نفس الـ TextStyle كل شوية.
// - ولو احتجنا نغيّر حجم خط أو لون، نعدّله من هنا بس.
//
// ملاحظات:
// - الأحجام كلها معمولة بـ ScreenUtil علشان تبقى Responsive.
// - الـ FontWeight جاي من FontWeightHelper عشان تبقى الدنيا منظمة.
// - الألوان واخدينها من AppColors عشان نمشي على نفس ثيم الأبلكيشن.
//
class TextStyles {
  static TextStyle font20WhiteSemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );
  static TextStyle font22Black05Reguler = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.black05,
  );
  static TextStyle font22greySemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.grey,
  );

  static TextStyle font48WhiteSemiBold = TextStyle(
    fontSize: 48.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );

  static TextStyle font20Black05Regular = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.black05,
  );
  static TextStyle font18Black05Bold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.black05,
  );
  static TextStyle font14WhiteSemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );
  static TextStyle font14green69Bold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.green69,
  );
  static TextStyle font20green69Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.green69,
  );
  static TextStyle font14greyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.grey,
  );
  static TextStyle font14Gray85SemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.gray85,
  );
  static TextStyle font22Black05Bold = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.black05,
  );
  static TextStyle font26green69Bold = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.green69,
  );

  static TextStyle font16Black05Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.black05,
  );
  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.white,
  );
  static TextStyle font24WhiteRegular = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.white,
  );

  static TextStyle font20Orange62Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.orange62,
  );

  static TextStyle font40WhiteSemiBold = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );

  static TextStyle font21GreenA4Regular = TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.greenA4,
  );

  static TextStyle font36WhiteSemiBold = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );
}
