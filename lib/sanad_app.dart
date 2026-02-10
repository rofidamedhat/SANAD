import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/core/themeing/colors.dart';

import 'core/routing/app_router.dart';

class SanadApp extends StatelessWidget {
  final AppRouter appRouter;

  const SanadApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    log(isLoginUser.toString());
    //عشان الابللكشين يكون مناسب مع كل احجام الشاشات
    return ScreenUtilInit(
      designSize: const Size(414, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Sanad',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
          fontFamily: 'Tajawal', // اسم الفونت العربي
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontFamily: 'Tajawal'),
          ),
        ),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl, // مهم للكتابة من اليمين لليسار
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
      
        initialRoute: Routes.onboardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
