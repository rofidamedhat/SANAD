import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/di/dependency_injection.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/feature/home_deaf_user/ui/home_deaf_user_screen.dart';
import 'package:sanad/feature/home_volunteer/ui/home_volunteer_screen.dart';
import 'package:sanad/feature/learn_alphabet/logic/cubit/learn_alphabet_cubit.dart';
import 'package:sanad/feature/learn_alphabet/ui/learn_alphabet_screen.dart';
import 'package:sanad/feature/learn_famous_words/ui/learn_words_screen.dart';
import 'package:sanad/feature/learn_numbers/logic/cubit/learn_number_cubit.dart';
import 'package:sanad/feature/learn_numbers/ui/learn_number_screen.dart';
import 'package:sanad/feature/learn_sign_lang/ui/learn_sign_lang_screen.dart';
import 'package:sanad/feature/login/logic/login_cubit.dart';
import 'package:sanad/feature/login/ui/login_screen.dart';
import 'package:sanad/feature/navigations/navigation_screen.dart';
import 'package:sanad/feature/signup/logic/signup_cubit.dart';
import 'package:sanad/feature/signup/ui/signup_screen.dart';

import '../../feature/convert_text_to_speech/ui/convert_text_to_speech_screen.dart';
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
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: SignupScreen(),
          ),
        );

      case Routes.homeVolunteer:
        return MaterialPageRoute(builder: (_) => HomeVolunteerScreen());
      case Routes.convertTextToSpeechScreen:
        return MaterialPageRoute(builder: (_) => ConvertTextToSpeechScreen());
      case Routes.homeDeafUser:
        return MaterialPageRoute(builder: (_) => HomeDeafUserScreen());
      case Routes.learnSignLangScreen:
        return MaterialPageRoute(builder: (_) => LearnSignLangScreen());

      case Routes.learnAlphabetScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LearnAlphabetCubit>(),
            child: LearnAlphabetScreen(),
          ),
        );

      case Routes.learnNumberScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LearnNumberCubit>(),
            child: LearnNumberScreen(),
          ),
        );
      case Routes.learnFamousWordsScreen:
        return MaterialPageRoute(builder: (_) => LearnFamousWordsScreen());
      case Routes.navigationScreen:
        return MaterialPageRoute(builder: (_) => NavigationScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
