import 'package:dio/dio.dart';
import 'package:sanad/feature/convert_text_to_speech/data/model/audio_response_body.dart';

import '../../../../core/networking/api_service.dart';

class TranslateTextRepo {

  final ApiService apiService;
  TranslateTextRepo(this.apiService);
  Future<AudioResponseBody>translateText(String text)async{

    return await apiService.translateText(text);
  }
}