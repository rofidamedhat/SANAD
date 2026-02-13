import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sanad/core/networking/api_service.dart';
import 'package:sanad/core/helper/shared_pref_helper.dart'; // تأكدي من مسار الهيلبر عندك
import 'package:sanad/feature/edit_profile/data/model/edit_profile_request_body.dart';
import 'package:sanad/feature/edit_profile/data/model/edit_profile_response_body.dart';

class EditProfileRepo {
  final ApiService apiService;

  EditProfileRepo(this.apiService);

  Future<EditProfileResponseBody> editProfile({
    required EditProfileRequestBody requestBody,
    File? image,
  }) async {
    // 1. جلب التوكن من الـ Shared Preferences
    // تأكدي أن الـ key هو "token" كما قمتِ بتخزينه عند تسجيل الدخول
    String? token = await SharedPrefHelper.getString("token");

    // 2. تجهيز ملف الصورة كـ MultipartFile لو موجود
    MultipartFile? multipartImage;
    if (image != null) {
      multipartImage = await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      );
    }

    // 3. إرسال الطلب للسيرفر مع التوكن في الـ Header
    return await apiService.editProfile(
      "Bearer $token", // تمرير التوكن لحل مشكلة الـ 401
      requestBody.FullName, // الحروف Capital كما في الـ Swagger
      requestBody.Email,
      requestBody.Role,
      multipartImage,
    );
  }
}