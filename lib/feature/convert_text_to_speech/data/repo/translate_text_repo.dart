import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sanad/feature/convert_text_to_speech/data/model/audio_response_body.dart';

import '../../../../core/networking/api_service.dart';

class TranslateTextRepo {

  final ApiService apiService;
  TranslateTextRepo(this.apiService);
  Future<AudioResponseBody>translateText(String text)async{

    return await apiService.translateText(text);
  }

  Future<AudioResponseBody>translateAudio(String audioPath)async{

    File audioFile = File(audioPath);

    MultipartFile multipartAudio = await MultipartFile.fromFile(
      audioFile.path,
      filename: "record.m4a",
      contentType: MediaType("audio", "m4a"),
    );

    return await apiService.uploadAudio(multipartAudio);
  }
}