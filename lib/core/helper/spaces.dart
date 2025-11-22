import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// -----------------------------------------------------------------------------
// الملف ده فيه شوية Functions بسيطة بتساعدنا نعمل مسافات فاضية (Spacing)
// بين العناصر في أي صفحة.
//
// ليه بنستخدمه؟
// - بدل ما نكتب SizedBox كل شوية، نستخدم دوال مختصرة وسهلة.
// - بيخلّي الكود أنضف وأسهل في القراءة.
// - ScreenUtil بيخلي المسافات Responsive وتشتغل صح على كل الشاشات.
//
// التفاصيل:
// - verticalSpace: بترجع SizedBox بالارتفاع اللي نحدده.
// - horizontalSpace: بترجع SizedBox بالعرض اللي نحدده.
// -----------------------------------------------------------------
Widget verticalSpace(double height) {
  return SizedBox(height: height.h);
}

Widget horizontalSpace(double width) {
  return SizedBox(width: width.w);
}
