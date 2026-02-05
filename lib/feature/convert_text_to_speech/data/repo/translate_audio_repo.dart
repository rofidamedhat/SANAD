import 'package:dio/dio.dart';
import 'package:sanad/feature/convert_text_to_speech/data/model/audio_response_body.dart';

import '../../../../core/networking/api_service.dart';

class TranslateAudioRepo {

  // final ApiService apiService;
  // TranslateAudioRepo(this.apiService);
  //
  // Future<AudioResponseBody>translateAudio(String path)async{
  //   final fileName = path.split('/').last;
  //
  //   final audioMultipart = await MultipartFile.fromFile(
  //     path,
  //     filename: fileName,
  //     contentType: DioMediaType('audio', 'mp3'),
  //   );
  //   return await apiService.uploadAudio(audioMultipart);
  // }
}