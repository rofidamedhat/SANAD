// -----------------------------------------------------------------------------
// الملف ده مسؤول عن كل الحاجات اللي الأبلكيشن هيحتاجها للتعامل مع السيرفر.
//
// ApiConstants:
// - بيحتوي على الـ URLs الأساسية لكل الـ Endpoints زي Login و Signup و Home.
// - يعني أي مكان محتاج يطلب داتا من السيرفر، يجيب الرابط من هنا.
//
// ApiErrors:
// - بيجمع كل أنواع الأخطاء اللي ممكن تحصل وانت بتتعامل مع السيرفر.
// - بدل ما نكتب كل Error String في كل صفحة، كله متجمع هنا.
// - بيخلّي التعامل مع الأخطاء منظم وأسهل في الفهم.
//
// باختصار:
// - أي حد عايز يعمل Request أو يتعامل مع Error يشوف هنا الأول.
// ---------------------------------

class ApiConstants {
  static const String baseUrl = "https://sanadapllication2025api.runasp.net/api/";
  static const String login = "Auth/login";
  static const String signup = "Auth/register";
  static const String home = "specialization/index";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
