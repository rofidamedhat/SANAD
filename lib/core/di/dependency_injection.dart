import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sanad/feature/add_question/data/repo/add_post_repo.dart';
import 'package:sanad/feature/chatting/data/model/chat_model.dart';
import 'package:sanad/feature/chatting/data/service/fb_services.dart';
import 'package:sanad/feature/chatting/logic/cubit/chat_cubit.dart';
import 'package:sanad/feature/chatting/ui/chat_details_screen.dart';
import 'package:sanad/feature/add_question/logic/add_post_logic/add_post_cubit.dart';
import 'package:sanad/feature/convert_text_to_speech/data/repo/translate_text_repo.dart';
import 'package:sanad/feature/convert_text_to_speech/logic/translate_audio_and_text_cubit.dart';
import 'package:sanad/feature/convert_video_to_text/data/repo/convert_video_repo.dart';
import 'package:sanad/feature/convert_video_to_text/logic/convert_video_to_text_cubit.dart';
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
import 'package:sanad/feature/delete_medicine/data/repo/delete_medicine_repo.dart';
import 'package:sanad/feature/delete_medicine/logic/delete_medicine_cubit.dart';
import '../../feature/login/data/repos/login_repo.dart';
import '../../feature/login/logic/login_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // Add Medicine
  getIt.registerLazySingleton<AddMedicineRepo>(() => AddMedicineRepo(getIt()));
  getIt.registerFactory<AddMedicineCubit>(() => AddMedicineCubit(getIt()));

  // Medicine Schedule
  getIt.registerLazySingleton<ScheduleRepo>(() => ScheduleRepo(getIt()));
  getIt.registerFactory<ScheduleCubit>(() => ScheduleCubit(getIt()));

  // Delete Medicine
  getIt.registerLazySingleton<DeleteMedicineRepo>(
    () => DeleteMedicineRepo(getIt()),
  );
  getIt.registerFactory<DeleteMedicineCubit>(
    () => DeleteMedicineCubit(getIt()),
  );

  // Add Post
  getIt.registerLazySingleton<AddPostRepo>(() => AddPostRepo(getIt()));
  getIt.registerFactory<AddPostCubit>(() => AddPostCubit(getIt()));

  // Get Post
  getIt.registerLazySingleton<GetPostRepo>(() => GetPostRepo(getIt()));
  getIt.registerFactory<GetPostCubit>(() => GetPostCubit(getIt()));
  //convert video
  getIt.registerLazySingleton<ConvertVideoRepo>(() => ConvertVideoRepo(getIt()));
  getIt.registerFactory<ConvertVideoToTextCubit>(() => ConvertVideoToTextCubit(getIt()));
  // Delete Post
  getIt.registerLazySingleton<DeletePostRepo>(() => DeletePostRepo(getIt()));
  getIt.registerFactory<PostDetailsCubit>(() => PostDetailsCubit(getIt()));

  // Edit Profile
  getIt.registerLazySingleton<EditProfileRepo>(() => EditProfileRepo(getIt()));
  getIt.registerFactory<EditProfileCubit>(() => EditProfileCubit(getIt()));

  // Profile
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(getIt()),
  );
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt(), getIt()));

  // Translate Text / Audio
  getIt.registerLazySingleton<TranslateTextRepo>(
    () => TranslateTextRepo(getIt()),
  );
  getIt.registerFactory<TranslateAudioAndTextCubit>(
    () => TranslateAudioAndTextCubit(getIt()),
  );

  // Learn Alphabet
  getIt.registerLazySingleton<LearnAlphabetRepo>(
    () => LearnAlphabetRepo(getIt()),
  );
  getIt.registerFactory<LearnAlphabetCubit>(() => LearnAlphabetCubit(getIt()));

  // Learn Numbers
  getIt.registerLazySingleton<LearnNumberRepo>(() => LearnNumberRepo(getIt()));
  getIt.registerFactory<LearnNumberCubit>(() => LearnNumberCubit(getIt()));

  // Learn Famous Words
  getIt.registerLazySingleton<LearnWordsRepo>(() => LearnWordsRepo(getIt()));
  getIt.registerFactory<LearnWordsCubit>(() => LearnWordsCubit(getIt()));

  // Learn Videos
  getIt.registerLazySingleton<LearnVideosRepo>(() => LearnVideosRepo(getIt()));
  getIt.registerFactory<LearnVideosCubit>(() => LearnVideosCubit(getIt()));

  // Firebase Chat
  getIt.registerLazySingleton<FireBaseService>(() => FireBaseService());
  getIt.registerLazySingleton<ChatCubit>(() => ChatCubit(getIt()));
  getIt.registerFactory<ChatDetailsScreen>(
    () => ChatDetailsScreen(chatModel: ChatModel()),
  );
}
