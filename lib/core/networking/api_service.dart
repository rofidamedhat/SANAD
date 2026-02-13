//اسمعي البلاي ليست دي ي شروق قبل متحطي ايدك في اللوجيك
// https://www.youtube.com/playlist?list=PLwWuxCLlF_ud0orMMKU893fm1OvF4xSRk

// -----------------------------------------------------------------------------
// الملف ده مسؤول عن تحديد كل الحاجات اللي الأبلكيشن ممكن يطلبها من السيرفر.
//
// باختصار:
// - هنا بنكتب الـ Endpoints: زي Login، Signup، وطلبات Home.
// - كل وظيفة هنا بتبعت Request للسيرفر وترجع Response محدد.
// - @POST و @GET مع الـ ApiConstants هما الطريقة اللي بنحدد بيها نوع الطلب والرابط.
//
// ملاحظات:
// - ده Abstract Class، يعني بنعمله Generate بعدين عشان يتحوّل لكلاس جاهز يستخدم Dio.
// - الأمر اللي تحت (`dart pub run build_runner build`) بيولّد الكود النهائي تلقائياً.
//
// باختصار: أي مكان محتاج يتكلم مع السيرفر، يشوف هنا الأول.
// -----------------------------------------------------------
import 'package:dio/dio.dart';
import 'package:sanad/feature/convert_text_to_speech/data/model/audio_response_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sanad/feature/learn_alphabet/data/models/learn_alphabet_model.dart';
import 'package:sanad/feature/learn_famous_words/data/models/learn_words_model.dart';
import 'package:sanad/feature/learn_numbers/data/models/learn_numbers_model.dart';
import 'package:sanad/feature/signup/data/model/signup_request_body.dart';

import '../../feature/login/data/model/login_request_body.dart';
import '../../feature/login/data/model/login_response_body.dart';
import '../../feature/signup/data/model/signup_response_body.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponseBody> signup(@Body() SignupRequestBody signupRequestBody);


@POST(ApiConstants.translateText)
Future<AudioResponseBody> translateText(@Body() String text);

@POST(ApiConstants.translateAudio)
@MultiPart()
  Future<AudioResponseBody> uploadAudio(
      @Part(name: "File") MultipartFile audio,
      );
 

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
}


//dart pub run build_runner build
