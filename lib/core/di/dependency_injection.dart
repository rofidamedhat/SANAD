import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sanad/feature/add_question/data/repo/add_post_repo.dart';
import 'package:sanad/feature/add_question/logic/add_post_cubit.dart';
import 'package:sanad/feature/chatting/data/model/chat_model.dart';
import 'package:sanad/feature/chatting/data/service/fb_services.dart';
import 'package:sanad/feature/chatting/logic/cubit/chat_cubit.dart';
import 'package:sanad/feature/chatting/ui/chat_details_screen.dart';
import 'package:sanad/feature/add_question/logic/add_post_logic/add_post_cubit.dart';
import 'package:sanad/feature/convert_text_to_speech/data/repo/translate_text_repo.dart';
import 'package:sanad/feature/convert_text_to_speech/logic/translate_audio_and_text_cubit.dart';
import 'package:sanad/feature/edit_profile/data/repo/edit_profile_repo.dart';
import 'package:sanad/feature/edit_profile/logic/edit_profile_cubit.dart';
import 'package:sanad/feature/learn_alphabet/data/repos/learn_alphabet_repo.dart';
import 'package:sanad/feature/learn_alphabet/logic/cubit/learn_alphabet_cubit.dart';
import 'package:sanad/feature/learn_famous_words/data/repo/learn_words_repo.dart';
import 'package:sanad/feature/learn_famous_words/logic/cubit/learn_words_cubit.dart';
import 'package:sanad/feature/learn_numbers/data/repos/learn_number_repo.dart';
import 'package:sanad/feature/learn_numbers/logic/cubit/learn_number_cubit.dart';
import 'package:sanad/feature/learn_videos/data/repo/learn_videos_repo.dart';
import 'package:sanad/feature/learn_videos/logic/cubit/learn_videos_cubit.dart';
import 'package:sanad/feature/post_details/data/repo/delete_post_repo.dart';
import 'package:sanad/feature/post_details/logic/post_details_cubit.dart';
import 'package:sanad/feature/profile/data/repo/profile_repo.dart';
import 'package:sanad/feature/profile/logic/profile_cubit.dart';
import 'package:sanad/feature/share_question/data/repo/get_post_repo.dart';
import 'package:sanad/feature/share_question/logic/get_post_logic/get_post_cubit.dart';
import 'package:sanad/feature/signup/data/repo/signup_repo.dart';
import 'package:sanad/feature/signup/logic/signup_cubit.dart';
import 'package:sanad/feature/add_medicine/logic/add_medicine_cubit.dart'; 
import 'package:sanad/feature/add_medicine/data/repo/add_medicine_repo.dart'; 
import 'package:sanad/feature/medicine_schedule/logic/schedule_cubit.dart'; 
import 'package:sanad/feature/medicine_schedule/data/repo/schedule_repo.dart'; 
import '../../feature/login/data/repos/login_repo.dart';
import '../../feature/login/logic/login_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // 1. Dio & ApiService (الأساس اللي الكل بيعتمد عليه)
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // 2. Add Medicine Feature
  getIt.registerLazySingleton<AddMedicineRepo>(() => AddMedicineRepo(getIt()));
  getIt.registerFactory<AddMedicineCubit>(() => AddMedicineCubit(getIt()));


  // 3. login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //add Post

  getIt.registerLazySingleton<AddPostRepo>(() => AddPostRepo(getIt()));
  getIt.registerFactory<AddPostCubit>(() => AddPostCubit(getIt()));
  //get post
  getIt.registerLazySingleton<GetPostRepo>(() => GetPostRepo(getIt()));
  getIt.registerFactory<GetPostCubit>(() => GetPostCubit(getIt()));

  //delete post
  getIt.registerLazySingleton<DeletePostRepo>(() => DeletePostRepo(getIt()));
  getIt.registerFactory<PostDetailsCubit>(() => PostDetailsCubit(getIt()));

  // // signup
  // 4. signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // 5. edit profile
  getIt.registerLazySingleton<EditProfileRepo>(() => EditProfileRepo(getIt()));
  getIt.registerFactory<EditProfileCubit>(() => EditProfileCubit(getIt()));
  getIt.registerFactory<EditProfileRepo>(() => EditProfileRepo(getIt()));
  // profile
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(getIt()),
  );
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt(), getIt()));

  // Translate text
  getIt.registerLazySingleton<TranslateTextRepo>(() => TranslateTextRepo(getIt()),);
  getIt.registerFactory<TranslateAudioAndTextCubit>(() => TranslateAudioAndTextCubit(getIt()),);
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

  // 6. profile
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));

  // 7. Translate text
  getIt.registerLazySingleton<TranslateTextRepo>(() => TranslateTextRepo(getIt()));
  getIt.registerFactory<TranslateAudioAndTextCubit>(() => TranslateAudioAndTextCubit(getIt()));

  // 8. Learn Alphabet
  getIt.registerLazySingleton<LearnAlphabetRepo>(() => LearnAlphabetRepo(getIt()));
  getIt.registerFactory<LearnAlphabetCubit>(() => LearnAlphabetCubit(getIt()));

  // 9. Learn Numbers
  getIt.registerLazySingleton<LearnNumberRepo>(() => LearnNumberRepo(getIt()));
  getIt.registerFactory<LearnNumberCubit>(() => LearnNumberCubit(getIt()));

  // 10. Learn Famous Words
  getIt.registerLazySingleton<LearnWordsRepo>(() => LearnWordsRepo(getIt()));
  getIt.registerFactory<LearnWordsCubit>(() => LearnWordsCubit(getIt()));

  // 11. Learn Videos
  getIt.registerLazySingleton<LearnVideosRepo>(() => LearnVideosRepo(getIt()));

  getIt.registerLazySingleton<FireBaseService>(() => FireBaseService());
  getIt.registerLazySingleton<ChatCubit>(() => ChatCubit(getIt()));
  getIt.registerFactory<ChatDetailsScreen>(
    () => ChatDetailsScreen(chatModel: ChatModel()),
  );

  // // home
  // getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  // getIt.registerFactory<HomeCubit>(
  //   () => HomeCubit(getIt())..getSpecialization(),
  // );

  getIt.registerFactory<LearnVideosCubit>(() => LearnVideosCubit(getIt()));

 // Schedule
  getIt.registerLazySingleton<ScheduleRepo>(() => ScheduleRepo(getIt()));
  getIt.registerFactory<ScheduleCubit>(() => ScheduleCubit(getIt()));
}
