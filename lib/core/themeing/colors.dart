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
  static const Color baseWhite = Color(0xFFFFFFFF);
  static const Color mainGreen = Color(0xFF2B6F69);
  static const Color baseBlack = Color(0xFF050505);
  static const Color baseOrange = Color(0xFFFFA762);
  static const Color lightGreen = Color(0xFF5FAAA4);

}
