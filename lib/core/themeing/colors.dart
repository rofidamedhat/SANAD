import 'package:flutter/material.dart';

// -----------------------------------------------------------------------------
// الملف ده مسؤول إنه يجمع كل الألوان الأساسية اللي هنستخدمها في الأبلكيشن
// في مكان واحد.
//
// ليه بنعمل كده؟
// - عشان نخلي كل المشروع ماشي على نفس الثيم والألوان.
// - نسهيّل علينا تغيير أي لون بعدين بدل ما ندور عليه في كل الصفحات.
// - نخلي شكل الأبلكيشن منظم وموحّد.
//
// ملاحظات:
// - كل الألوان هنا ثابتة (const) عشان الأداء يبقى أحسن.
// - تقسيمة الدرجات الأخف والأغمق معمولة عشان نستخدمها في الخلفيات، البوردر،
//   والنصوص حسب الحاجة.
// --
class AppColors {
  static const Color mainBlue = Color(0xFF247CFF);
  static const Color lightBlue = Color(0xFFF4F8FF);
  static const Color darkBlue = Color(0xFF242424);
  static const Color gray = Color(0xFF757575);
  static const Color lightGray = Color(0xFFC2C2C2);
  static const Color lighterGray = Color(0xFFEDEDED);
  static const Color moreLightGray = Color(0xFFFDFDFF);
  static const Color moreLighterGray = Color(0xFFF5F5F5);
}
