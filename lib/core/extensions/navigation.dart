import 'package:flutter/material.dart';

// -----------------------------------------------------------------------------
// الملف ده عامل Extension على الـ BuildContext علشان نسهل موضوع التنقّل
// بين الصفحات في الأبلكيشن.
//
// ليه بنعمل كده؟
// - عشان بدل ما نكتب Navigator.of(context) كل شوية، نستخدم دوال مختصرة.
// - بيخلي شكل الكود أنضف وأسهل في القراءة.
// - بيسهّل علينا نمرّر Arguments ونستبدل الصفحات ونمسح الStack بسهولة.
//
// الدوال اللي موجودة:
// - pushNamed: يودّي لصفحة جديدة بالRoute Name.
// - pushReplacementNamed: يستبدل الصفحة الحالية بواحدة جديدة.
// - pushNamedAndRemoveUntil: يفتح صفحة ويشيل اللي قبلها حسب شرط معين.
// - pop: يرجّعنا لورا.
//هنستعملها كده
//context.pushReplacementNamed(routes.splashScreen);
//context.pushNamed('/login');
//
extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate routePredicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, routePredicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
