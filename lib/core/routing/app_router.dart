import 'package:flutter/material.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/feature/login/ui/login_screen.dart';
import 'package:sanad/feature/signup/ui/signup_screen.dart';

import '../../feature/onboarding/onboarding_screen.dart';

// -----------------------------------------------------------------------------
// الملف ده مسؤول إنه يربط اسم الـ Route بالصفحة اللي هنروح لها.
// يعني لما ننادي بـ context.pushNamed(...) هو اللي بيحدد هنفتح أي Screen.
//
// ليه بنستخدمه؟
// - عشان نخلي التنقّل Organized ومن مكان واحد.
// - نقدر نضيف BlocProvider أو Dependencies حوالين كل صفحة بسهولة.
//
// ملاحظات:
// - الصفحات لسه متعلّقة (comment) لحد ما تتظبط.
// ---------------------------------
class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //هستخدمه عشان انقل من سكرين لسكرين
    switch (settings.name) {
      case Routes.onboardingScreen:
      return MaterialPageRoute(builder: (_) => OnboardingScreen ());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen ());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen ());

      default:
        return null;
    }
  }
}
