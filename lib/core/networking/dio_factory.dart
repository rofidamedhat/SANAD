import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sanad/core/helper/shared_pref_helper.dart';

// -----------------------------------------------------------------------------
// الملف ده مسؤول عن تجهيز الـ Dio اللي الأبلكيشن هيستخدمه عشان يبعت Requests
// للسيرفر.
//
// باختصار:
// - بيعمل instance واحد بس من Dio (Singleton) لكل الأبلكيشن.
// - بيحدد الـ Timeout لكل الطلبات (30 ثانية).
// - بيضيف الـ Headers المطلوبة تلقائياً، زي Authorization و Accept.
// - فيه دالة مخصوصة نستخدمها بعد Login عشان نحط التوكن الجديد في الـ Header.
// - بيضيف Interceptor (PrettyDioLogger) عشان نقدر نطبع Requests و Responses
//   في Console للتصحيح.
//
// ليه ده مهم؟
// - أي صفحة محتاجة تتكلم مع السيرفر تستخدم Dio ده بدل ما تعمل Instance جديد.
// - بيخلّي الكود منظم وسهل تصحيحه ومتابعته.
// ---------------------------------------
class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getString("token")}',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
