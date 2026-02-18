import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sanad/core/networking/api_service.dart';
import 'package:sanad/core/helper/shared_pref_helper.dart';
import 'package:sanad/feature/edit_profile/data/model/edit_profile_request_body.dart';
import 'package:sanad/feature/edit_profile/data/model/edit_profile_response_body.dart';

class EditProfileRepo {
  final ApiService apiService;

  EditProfileRepo(this.apiService);

  Future<EditProfileResponseBody> editProfile({
    required EditProfileRequestBody requestBody,
    File? image,
  }) async {
    String? token = await SharedPrefHelper.getString("token");

    MultipartFile? multipartImage;
    if (image != null) {
      multipartImage = await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      );
    }

    return await apiService.editProfile(
      "Bearer $token", 
      requestBody.FullName, 
      requestBody.Email,
      requestBody.Role,
      multipartImage,
    );
  }
}