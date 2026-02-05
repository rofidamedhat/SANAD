import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/core/networking/api_error_model.dart';
import 'package:sanad/feature/convert_text_to_speech/data/model/audio_response_body.dart';
import 'package:sanad/feature/convert_text_to_speech/data/repo/translate_text_repo.dart';

part 'translate_audio_and_text_state.dart';

class TranslateAudioAndTextCubit extends Cubit<TranslateAudioAndTextState> {
  
  TranslateTextRepo translateTextRepo;
  TranslateAudioAndTextCubit(this.translateTextRepo) : super(TranslateAudioAndTextInitial());
  
  AudioResponseBody? audioResponseBody;
  
  void translateText(String text)async{
    emit(TranslateTextLoading());
    
    try{
      audioResponseBody=await translateTextRepo.translateText(text);
      if(audioResponseBody!.statusCode==200){
        emit(TranslateTextWithSuccessfully(audioResponseBody: audioResponseBody!));
      }
      else{
        print("Error from response ${audioResponseBody!.message}");
        emit(TranslateTextWithError(apiErrorModel: ApiErrorHandler.handle(audioResponseBody)));
      }
    }catch(error,stackTrace){
      print("Error from cubit $error");
      print("stack trace from cubit ${stackTrace}");
      emit(TranslateTextWithError(apiErrorModel: ApiErrorHandler.handle(error)));
    }
  }
}
