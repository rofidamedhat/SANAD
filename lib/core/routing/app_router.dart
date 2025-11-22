import 'package:flutter/material.dart';
import 'package:sanad/core/routing/routes.dart';

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
    ;
    //هستخدمه عشان انقل من سكرين لسكرين
    switch (settings.name) {
      case Routes.splashScreen:
      // return MaterialPageRoute(builder: (_) => const ());
      // case Routes.loginScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<LoginCubit>(),
      //       child: const LoginScreen(),
      //     ),
      //   );

      // case Routes.signUpScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<SignUpCubit>(),
      //       child: const SignUpScreen(),
      //     ),
      //   );

      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<HomeCubit>(),
      //       child: const HomeScreen(),
      //     ),
      //   );

      default:
        return null;
    }
  }
}
