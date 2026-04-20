import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/di/dependency_injection.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/feature/add_question/logic/add_post_cubit.dart';
import 'package:sanad/feature/add_question/ui/add_question_screen.dart';
import 'package:sanad/feature/convert_text_to_speech/logic/translate_audio_and_text_cubit.dart';
import 'package:sanad/feature/home_deaf_user/ui/home_deaf_user_screen.dart';
import 'package:sanad/feature/home_volunteer/ui/home_volunteer_screen.dart';
import 'package:sanad/feature/learn_alphabet/logic/cubit/learn_alphabet_cubit.dart';
import 'package:sanad/feature/learn_alphabet/ui/learn_alphabet_screen.dart';
import 'package:sanad/feature/learn_famous_words/logic/cubit/learn_words_cubit.dart';
import 'package:sanad/feature/learn_famous_words/ui/learn_words_screen.dart';
import 'package:sanad/feature/learn_numbers/logic/cubit/learn_number_cubit.dart';
import 'package:sanad/feature/learn_numbers/ui/learn_number_screen.dart';
import 'package:sanad/feature/learn_sign_lang/ui/learn_sign_lang_screen.dart';
import 'package:sanad/feature/learn_videos/logic/cubit/learn_videos_cubit.dart';
import 'package:sanad/feature/learn_videos/ui/learn_videos.dart';
import 'package:sanad/feature/login/logic/login_cubit.dart';
import 'package:sanad/feature/login/ui/login_screen.dart';
import 'package:sanad/feature/navigations/navigation_screen.dart';
import 'package:sanad/feature/onboarding/onboarding_details_screen.dart';
import 'package:sanad/feature/share_question/ui/share_questions_screen.dart';
import 'package:sanad/feature/signup/logic/signup_cubit.dart';
import 'package:sanad/feature/signup/ui/signup_screen.dart';
import 'package:sanad/feature/edit_profile/ui/edit_profile_screen.dart';
import 'package:sanad/feature/edit_profile/logic/edit_profile_cubit.dart';

import 'package:sanad/feature/profile/ui/profile_screen.dart';
import 'package:sanad/feature/profile/logic/profile_cubit.dart';

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

      case Routes.onboardingDetailsScreen:
        return MaterialPageRoute(builder: (_) => OnboardingDetailsScreen());

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
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TranslateAudioAndTextCubit>(),
            child: ConvertTextToSpeechScreen(),
          ),
        );
      case Routes.homeDeafUser:
        return MaterialPageRoute(builder: (_) => HomeDeafUserScreen());
      case Routes.learnSignLangScreen:
        return MaterialPageRoute(builder: (_) => LearnSignLangScreen());

      case Routes.learnAlphabetScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LearnAlphabetCubit>()..getLetters(),
            child: LearnAlphabetScreen(),
          ),
        );

      case Routes.learnNumberScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LearnNumberCubit>()..getNumbers(),
            child: LearnNumberScreen(),
          ),
        );
      case Routes.learnFamousWordsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<LearnWordsCubit>()..getWords(),
            child: LearnFamousWordsScreen(),
          ),
        );

      case Routes.learnVideosScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<LearnVideosCubit>()..getVideos(),
            child: LearnVideosScreen(),
          ),
        );

      case Routes.navigationScreen:
        return MaterialPageRoute(builder: (_) => NavigationScreen());

      case Routes.shareQuestionsScreen:
        return MaterialPageRoute(builder: (_) => ShareQuestionsScreen());

      case Routes.addQuestionsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddPostCubit>(),
            child: AddQuestionScreen(),
          ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );

      case Routes.profile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProfileCubit>()..loadProfile(),
            child: const ProfileScreen(),
          ),
        );

      case Routes.editprofile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<EditProfileCubit>(),
            child: const EditProfileScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
