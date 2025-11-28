
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

import '../../feature/login/data/model/login_request_body.dart';
import '../../feature/login/data/model/login_response_body.dart';
import 'api_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);


}

//dart pub run build_runner build
