//السطور اللى معمول ليها كومنت ده الفايل الاصلي بتاع عمر بس مش ماشي مع الباك اند بتاعنا
// // // TODO: wallahy I will refactor this .. Omar Ahmed
// // import 'package:dio/dio.dart';
// // import 'package:sanad/core/networking/api_constants.dart';
// // import 'package:sanad/core/networking/api_error_model.dart';
//
// import 'package:dio/dio.dart';
//
// import 'api_constants.dart';
// import 'api_error_model.dart';
// // // -----------------------------------------------------------------------------
// // // الملف ده مسؤول عن التعامل مع أي حاجة ممكن تحصل وانت بتتكلم مع السيرفر.
// // //
// // // باختصار:
// // // - لما الأبلكيشن يبعت Request للسيرفر، أحياناً هيوصل بيانات، وأحياناً يحصل Error.
// // // - هنا بنعرف كل أنواع الـ Errors الممكنة (زي No Internet، Timeout، 401 Unauthorized… إلخ).
// // // - بنربط كل Error بكود رقمي ورسالة مفهومة علشان نعرضها للمستخدم.
// // //
// // // التفاصيل:
// // // 1. DataSource: كل أنواع الـ Errors اللي ممكن تحصل.
// // // 2. ResponseCode & ResponseMessage: الكود والرسالة لكل حالة Error.
// // // 3. DataSourceExtension.getFailure(): بترجع ApiErrorModel جاهزة لأي Error.
// // // 4. ErrorHandler: بياخد أي Exception من Dio ويرجّع ApiErrorModel مناسب.
// // // 5. ApiInternalStatus: علامة بسيطة تقول لو العملية ناجحة أو فشلت داخل الـ API.
// // //
// // // باختصار: أي مكان محتاج يرسل Request أو يتعامل مع Error يشوف هنا الأول.
// // // -------------------------------------------
// enum DataSource {
//   NO_CONTENT,
//   BAD_REQUEST,
//   FORBIDDEN,
//   UNAUTORISED,
//   NOT_FOUND,
//   INTERNAL_SERVER_ERROR,
//   CONNECT_TIMEOUT,
//   CANCEL,
//   RECIEVE_TIMEOUT,
//   SEND_TIMEOUT,
//   CACHE_ERROR,
//   NO_INTERNET_CONNECTION,
//   // API_LOGIC_ERROR,
//   DEFAULT,
// }
//
// // class ResponseCode {
// //   static const int SUCCESS = 200; // success with data
// //   static const int NO_CONTENT = 201; // success with no data (no content)
// //   static const int BAD_REQUEST = 400; // failure, API rejected request
// //   static const int UNAUTORISED = 401; // failure, user is not authorised
// //   static const int FORBIDDEN = 403; //  failure, API rejected request
// //   static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
// //   static const int NOT_FOUND = 404; // failure, not found
// //   static const int API_LOGIC_ERROR = 422; // API , lOGIC ERROR
//
// //   // local status code
// //   static const int CONNECT_TIMEOUT = -1;
// //   static const int CANCEL = -2;
// //   static const int RECIEVE_TIMEOUT = -3;
// //   static const int SEND_TIMEOUT = -4;
// //   static const int CACHE_ERROR = -5;
// //   static const int NO_INTERNET_CONNECTION = -6;
// //   static const int DEFAULT = -7;
// // }
//
// class ResponseMessage {
//   static const String NO_CONTENT =
//       ApiErrors.noContent; // success with no data (no content)
//   static const String BAD_REQUEST =
//       ApiErrors.badRequestError; // failure, API rejected request
//   static const String UNAUTORISED =
//       ApiErrors.unauthorizedError; // failure, user is not authorised
//   static const String FORBIDDEN =
//       ApiErrors.forbiddenError; //  failure, API rejected request
//   static const String INTERNAL_SERVER_ERROR =
//       ApiErrors.internalServerError; // failure, crash in server side
//   static const String NOT_FOUND =
//       ApiErrors.notFoundError; // failure, crash in server side
//
//   // local status code
//   static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
//   static String CANCEL = ApiErrors.defaultError;
//   static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
//   static String SEND_TIMEOUT = ApiErrors.timeoutError;
//   static String CACHE_ERROR = ApiErrors.cacheError;
//   static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
//   static String DEFAULT = ApiErrors.defaultError;
// }
//
// extension DataSourceExtension on DataSource {
//   ApiErrorModel getFailure() {
//     switch (this) {
//       case DataSource.NO_CONTENT:
//         return ApiErrorModel(
//           message: ResponseMessage.NO_CONTENT,
//         );
//       case DataSource.BAD_REQUEST:
//         return ApiErrorModel(
//           message: ResponseMessage.BAD_REQUEST,
//         );
//       case DataSource.FORBIDDEN:
//         return ApiErrorModel(
//           message: ResponseMessage.FORBIDDEN,
//         );
//       case DataSource.UNAUTORISED:
//         return ApiErrorModel(
//           message: ResponseMessage.UNAUTORISED,
//         );
//       case DataSource.NOT_FOUND:
//         return ApiErrorModel(
//           message: ResponseMessage.NOT_FOUND,
//         );
//       case DataSource.INTERNAL_SERVER_ERROR:
//         return ApiErrorModel(
//           message: ResponseMessage.INTERNAL_SERVER_ERROR,
//         );
//       case DataSource.CONNECT_TIMEOUT:
//         return ApiErrorModel(
//           message: ResponseMessage.CONNECT_TIMEOUT,
//         );
//       case DataSource.CANCEL:
//         return ApiErrorModel(
//           message: ResponseMessage.CANCEL,
//         );
//       case DataSource.RECIEVE_TIMEOUT:
//         return ApiErrorModel(
//           message: ResponseMessage.RECIEVE_TIMEOUT,
//         );
//       case DataSource.SEND_TIMEOUT:
//         return ApiErrorModel(
//           message: ResponseMessage.SEND_TIMEOUT,
//         );
//       case DataSource.CACHE_ERROR:
//         return ApiErrorModel(
//           message: ResponseMessage.CACHE_ERROR,
//         );
//       case DataSource.NO_INTERNET_CONNECTION:
//         return ApiErrorModel(
//           message: ResponseMessage.NO_INTERNET_CONNECTION,
//         );
//       case DataSource.DEFAULT:
//         return ApiErrorModel(
//           message: ResponseMessage.DEFAULT,
//         );
//     }
//   }
// }
//
//
// class ErrorHandler implements Exception {
//   late ApiErrorModel apiErrorModel;
//
//   ErrorHandler.handle(dynamic error) {
//     if (error is DioException) {
//       // dio error so its an error from response of the API or from dio itself
//       apiErrorModel = _handleError(error);
//     } else {
//       // default error
//       apiErrorModel = DataSource.DEFAULT.getFailure();
//     }
//   }
// }
//
// ApiErrorModel _handleError(DioException error) {
//   switch (error.type) {
//     case DioExceptionType.connectionTimeout:
//       return DataSource.CONNECT_TIMEOUT.getFailure();
//     case DioExceptionType.sendTimeout:
//       return DataSource.SEND_TIMEOUT.getFailure();
//     case DioExceptionType.receiveTimeout:
//       return DataSource.RECIEVE_TIMEOUT.getFailure();
//     case DioExceptionType.badResponse:
//       if (error.response != null &&
//           error.response?.statusCode != null &&
//           error.response?.statusMessage != null) {
//         return ApiErrorModel.fromJson(error.response!.data);
//       } else {
//         return DataSource.DEFAULT.getFailure();
//       }
//     case DioExceptionType.unknown:
//       if (error.response != null &&
//           error.response?.statusCode != null &&
//           error.response?.statusMessage != null) {
//         return ApiErrorModel.fromJson(error.response!.data);
//       } else {
//         return DataSource.DEFAULT.getFailure();
//       }
//     case DioExceptionType.cancel:
//       return DataSource.CANCEL.getFailure();
//     case DioExceptionType.connectionError:
//       return DataSource.DEFAULT.getFailure();
//     case DioExceptionType.badCertificate:
//       return DataSource.DEFAULT.getFailure();
//     case DioExceptionType.badResponse:
//       return DataSource.DEFAULT.getFailure();
//   }
// }
//
// // class ApiInternalStatus {
// //   static const int SUCCESS = 0;
// //   static const int FAILURE = 1;
// // }
//update of error handler file based on my end point
import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler  {

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch(error.type){
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection server is failed");

        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection time out");

        case DioExceptionType.cancel:
          return ApiErrorModel(message: " Cancelled this request");

        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);

        default:
          return ApiErrorModel(message: "Unknown error ");
      }
    } else {
      // default error
      return ApiErrorModel(message: "Unknown error happened");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {

  return ApiErrorModel(
    message: data["message"] ?? "Something wrong",
  );
}