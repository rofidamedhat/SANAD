import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sanad/feature/convert_text_to_speech/data/repo/translate_text_repo.dart';
import 'package:sanad/feature/convert_text_to_speech/logic/translate_audio_and_text_cubit.dart';
import 'package:sanad/feature/learn_alphabet/data/repos/learn_alphabet_repo.dart';
import 'package:sanad/feature/learn_alphabet/logic/cubit/learn_alphabet_cubit.dart';
import 'package:sanad/feature/learn_famous_words/data/repo/learn_words_repo.dart';
import 'package:sanad/feature/learn_famous_words/logic/cubit/learn_words_cubit.dart';
import 'package:sanad/feature/learn_numbers/data/repos/learn_number_repo.dart';
import 'package:sanad/feature/learn_numbers/logic/cubit/learn_number_cubit.dart';
import 'package:sanad/feature/signup/data/repo/signup_repo.dart';
import 'package:sanad/feature/signup/logic/signup_cubit.dart';

import '../../feature/login/data/repos/login_repo.dart';
import '../../feature/login/logic/login_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

// -----------------------------------------------------------------------------
// الملف ده مسؤول عن ترتيب كل الحاجات اللي الأبلكيشن محتاجها قبل ما يبدأ.
// يعني بنسجّل Services وRepositories وCubits هنا عشان نقدر نستخدمهم
// في أي مكان من غير ما نعملهم كل مرة.
//
// باختصار:
// - getIt ده زي "حافظة" لكل الحاجات اللي محتاجينها في الأبلكيشن.
// - بدل ما نعمل instance جديد في كل صفحة، بنسجّلها هنا مرة واحدة.
// - لما نحتاج حاجة، بنجيبها من getIt بسهولة.
//
// ملاحظات:
// - الكود اللي جوا متعلّق لحد ما نجهّز الـ ApiService و Cubits.
// ------------------
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // Translate text
  getIt.registerLazySingleton<TranslateTextRepo>(() => TranslateTextRepo(getIt()));
  getIt.registerFactory<TranslateAudioAndTextCubit>(() => TranslateAudioAndTextCubit(getIt()));
  //LearnAlphabet
  getIt.registerLazySingleton<LearnAlphabetCubit>(
    () => LearnAlphabetCubit(getIt()),
  );
  getIt.registerLazySingleton<LearnAlphabetRepo>(
    () => LearnAlphabetRepo(getIt()),
  );
  //LearnNumbers
  getIt.registerLazySingleton<LearnNumberCubit>(
    () => LearnNumberCubit(getIt()),
  );
  getIt.registerLazySingleton<LearnNumberRepo>(() => LearnNumberRepo(getIt()));
  //LearnFamousWords
  getIt.registerLazySingleton<LearnWordsCubit>(() => LearnWordsCubit(getIt()));
  getIt.registerLazySingleton<LearnWordsRepo>(() => LearnWordsRepo(getIt()));

  // // home
  // getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  // getIt.registerFactory<HomeCubit>(
  //   () => HomeCubit(getIt())..getSpecialization(),
  // );
}
