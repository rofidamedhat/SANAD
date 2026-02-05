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
  static const Color white = Color(0xFFFFFFFF);
  static const Color whitef5 = Color(0xFFf5f5f5);
  static const Color green69 = Color(0xFF2B6F69);
  static const Color black05 = Color(0xFF050505);
  static const Color orange62 = Color(0xFFFFA762);
  static const Color greenA4 = Color(0xFF5FAAA4);
  static const Color greenC2 = Color(0xFF9FD6C2);
  static const Color blueE0 = Color(0xFFAED7E0);
  static const Color beigeD2 = Color(0xFFF1E9D2);
  static const Color orangeA6 = Color(0xFFF4C6A6);
  static const Color gray = Color(0xFFF7F6F4);
  static const Color gray85 = Color(0xFF878685);
  static const Color grayC1 = Color(0xFFC3C2C1);
}
