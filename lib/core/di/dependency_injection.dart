import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
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
  // // home
  // getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  // getIt.registerFactory<HomeCubit>(
  //   () => HomeCubit(getIt())..getSpecialization(),
  // );
}
