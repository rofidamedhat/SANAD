import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/core/themeing/colors.dart';

import 'core/routing/app_router.dart';

class SanadApp extends StatelessWidget {
  const SanadApp({super.key});

  @override
  Widget build(BuildContext context) {
    //عشان الابللكشين يكون مناسب مع كل احجام الشاشات
    return ScreenUtilInit(
      designSize: const Size(414, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
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
        initialRoute: Routes.learnSignLangScreen,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
