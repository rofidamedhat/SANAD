import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sanad/feature/add_question/data/model/add_post_model/add_post_response_body.dart';
import 'package:sanad/feature/convert_text_to_speech/data/model/audio_response_body.dart';
import 'package:sanad/feature/learn_alphabet/data/models/learn_alphabet_model.dart';
import 'package:sanad/feature/learn_famous_words/data/models/learn_words_model.dart';
import 'package:sanad/feature/learn_numbers/data/models/learn_numbers_model.dart';
import 'package:sanad/feature/learn_videos/data/model/learn_videos_model.dart';
import 'package:sanad/feature/signup/data/model/signup_request_body.dart';

import '../../feature/edit_profile/data/model/edit_profile_response_body.dart';
import '../../feature/login/data/model/login_request_body.dart';
import '../../feature/login/data/model/login_response_body.dart';
import '../../feature/post_details/data/model/delete_post_model/delete_post_response_body.dart';
import '../../feature/profile/data/model/profile_response_body.dart';
import '../../feature/share_question/data/model/get_post_model/get_post_response_body.dart';
import '../../feature/signup/data/model/signup_response_body.dart';
import '../../feature/add_medicine/data/model/add_medicine_request_body.dart';
import '../../feature/add_medicine/data/model/add_medicine_response_body.dart';
import 'package:sanad/feature/medicine_schedule/data/model/medicine_schedule_response.dart';


import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponseBody> signup(
    @Body() SignupRequestBody signupRequestBody,
  );

  @GET(ApiConstants.profile)
  Future<ProfileResponseBody> profile();

  @GET(ApiConstants.getPost)
  Future<GetPostResponseBody> getPost();

  @DELETE(ApiConstants.deletePost)
  Future<DeletePostResponseBody> deletePost(@Body() Map<String,dynamic> content);

  @MultiPart()
  @PUT("profile")
  Future<EditProfileResponseBody> editProfile(
    @Header("Authorization") String token,
    @Part(name: "FullName") String fullName,
    @Part(name: "Email") String email,
    @Part(name: "Role") String role,
    @Part(name: "ProfileImage") MultipartFile? profileImage,
  );

  @POST(ApiConstants.translateText)
  Future<AudioResponseBody> translateText(@Body() String text);

  @POST(ApiConstants.translateAudio)
  @MultiPart()
  Future<AudioResponseBody> uploadAudio(
      @Part(name: "File") MultipartFile audio,
      );

  @POST(ApiConstants.addPost)
  Future<AddPostResponseBody> addPost(@Body() Map<String,dynamic> content);


  @GET(ApiConstants.learingLeatters)
  Future<LearnAlphabetModel> getLetters(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET(ApiConstants.learingNumbers)
  Future<LearnNumbersModel> getNumbers(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET(ApiConstants.learingWords)
  Future<LearnWordsModel> getWords(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET(ApiConstants.learingVideos)
  Future<LearnVideosModel> getVideos();

 @POST(ApiConstants.addMedicine)
  Future<AddMedicineResponse> addMedicine(
    @Body() AddMedicineRequestBody addMedicineRequestBody,
  );

 @GET(ApiConstants.medicineSchedule)
  Future<MedicineScheduleResponse> getMedicineSchedule(
  @Query("day") String day
  );
}