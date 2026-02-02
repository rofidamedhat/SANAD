class Routes {
  // -----------------------------------------------------------------------------
  // الملف ده مجمّع كل الـ Route Names اللي بنستخدمها في التنقّل بين الصفحات.
  //
  // ليه بنعمل كده؟
  // - عشان نمنع اللخبطة بدل ما نكتب الRoutes كـ String في كل مكان.
  // - لو غيّرنا اسم Route نعدّله من هنا بس.
  // - بيسهّل علينا نستخدم الـ Navigation Extension اللي عملناه قبل كده.
  //
  // الملاحظات:
  // - كل Route معمول ثابت (const) علشان ميتغيرش بالغلط.
  // - الأسامي واضحة وبتوصف الصفحة اللي هنتنقّل ليها.
  //
  // مثال للاستخدام:
  // context.pushNamed(Routes.loginScreen);
  // ---------------------------------------------------------
  static const String splashScreen = '/splashScreen';
  static const String onboardingScreen = '/onboardingScreen';
  static const String loginScreen = '/loginScreen';
  static const String homeVolunteer = '/homeVolunteer';
  static const String homeDeafUser = '/homeDeafUser';
  static const String signUpScreen = '/signUpScreen';
  static const String learnSignLangScreen = '/learnSignLangScreen';
  static const String learnAlphabetScreen = '/learnAlphabetScreen';
  static const String learnNumberScreen = '/learnNumberScreen';
  static const String learnFamousWordsScreen = '/learnFamousWordsScreen';
}
