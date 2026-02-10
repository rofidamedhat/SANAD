// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:sanad/core/networking/api_error_handler.dart';
// import 'package:sanad/feature/convert_text_to_speech/data/model/audio_response_body.dart';
// import 'package:sanad/feature/convert_text_to_speech/data/repo/translate_audio_repo.dart';
//
// import '../../../core/networking/api_error_model.dart';
//
// part 'translate_audio_and_text_state.dart';
//
// class TranslateAudioAndTextCubit extends Cubit<TranslateAudioAndTextState> {
//   TranslateAudioRepo translateAudioRepo;
//   TranslateAudioAndTextCubit(this.translateAudioRepo) : super(TranslateAudioAndTextInitial());
//
//   AudioResponseBody? audioResponseBody;
//   void translateAudio(String path)async{
//
//     emit(TranslateAudioLoading());
//     try{
//       audioResponseBody= await translateAudioRepo.translateAudio(path);
//       if(audioResponseBody!.statusCode==200){
//         emit(TranslateAudioSuccessfully(audioResponseBody: audioResponseBody!));
//       }
//       else{
//         print("Error from response ${audioResponseBody!.message}");
//         emit(TranslateAudioWithError(apiErrorMessage: ApiErrorHandler.handle(audioResponseBody)));
//       }
//     }catch(error,stackTrace){
//       print("error from cubit $error");
//       print("Stack Trace $stackTrace");
//       emit(TranslateAudioWithError(apiErrorMessage: ApiErrorHandler.handle(error)));
//     }
//   }
// }
