import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sanad/feature/convert_video_to_text/data/model/translate_video_response_body.dart';

import '../../../../core/networking/api_service.dart';

class ConvertVideoRepo{
  final ApiService apiService;
  ConvertVideoRepo(this.apiService);

Future<TranslateVideoResponseBody>translateVideo(File videoFile)async{

  String fileName = videoFile.path.split('/').last;

  // 2. تحويل الـ File لكائن MultipartFile المدعوم من Dio
  MultipartFile multipartFile = await MultipartFile.fromFile(
    videoFile.path,
    filename: fileName,
  );
  return await apiService.uploadVideo(multipartFile);
}
}