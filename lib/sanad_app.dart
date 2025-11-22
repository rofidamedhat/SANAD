import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SanadApp extends StatelessWidget {
  const SanadApp({super.key});

  @override
  Widget build(BuildContext context) {
    //عشان الابللكشين يكون مناسب مع كل احجام الشاشات
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: isLoginUser ? Routes.homeScreen : Routes.loginScreen,
        // onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
