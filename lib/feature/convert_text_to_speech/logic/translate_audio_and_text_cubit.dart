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
  
  AudioResponseBody? audioResponseBodyFromText;
  AudioResponseBody? audioResponseBodyToText;
  String text="";
  
  void translateText(String text)async{
    emit(TranslateTextLoading());
    
    try{
      audioResponseBodyFromText=await translateTextRepo.translateText(text);
      if(audioResponseBodyFromText!.statusCode==200){
        emit(TranslateTextWithSuccessfully(audioResponseBody: audioResponseBodyFromText!));
      }
      else{
        print("Error from response ${audioResponseBodyFromText!.message}");
        emit(TranslateTextWithError(apiErrorModel: ApiErrorHandler.handle(audioResponseBodyFromText)));
      }
    }catch(error,stackTrace){
      print("Error from cubit $error");
      print("stack trace from cubit ${stackTrace}");
      emit(TranslateTextWithError(apiErrorModel: ApiErrorHandler.handle(error)));
    }
  }

  void translateToText(String audioPath)async{

    emit(TranslateAudioLoading());
    try{
      audioResponseBodyToText=await translateTextRepo.translateAudio(audioPath);
      if(audioResponseBodyToText!.statusCode==200){
        emit(TranslateAudioSuccessfully(audioResponseBody: audioResponseBodyToText!));
      }
      else{
        print("error from object is ${audioResponseBodyToText!.message}");
        emit(TranslateAudioWithError(apiErrorModel: ApiErrorHandler.handle(audioResponseBodyToText)));
      }
    }catch(error,stackTrace){
      print("Error from translate to text is $error");
      print("stack trace from translate to text is $stackTrace");
      emit(TranslateAudioWithError(apiErrorModel: ApiErrorHandler.handle(error)));
    }
  }
}
