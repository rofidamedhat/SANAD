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
  static TextStyle font20SemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.baseWhite,
  );

  static TextStyle font48SemiBold = TextStyle(
    fontSize: 48.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.baseWhite,
  );

  static TextStyle font20Regular = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.baseBlack,
  );

  static TextStyle font24Regular = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.baseWhite,
  );

  static TextStyle font20Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.baseOrange,
  );

  static TextStyle font40SemiBold = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.baseWhite,
  );

  static TextStyle font21Regular = TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.lightGreen,
  );

  static TextStyle font36SemiBold = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.baseWhite,
  );
}