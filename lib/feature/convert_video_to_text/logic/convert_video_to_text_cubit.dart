import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/core/networking/api_error_model.dart';
import 'package:sanad/feature/convert_video_to_text/data/model/translate_video_response_body.dart';
import 'package:sanad/feature/convert_video_to_text/data/repo/convert_video_repo.dart';
import 'package:video_player/video_player.dart';

part 'convert_video_to_text_state.dart';

class ConvertVideoToTextCubit extends Cubit<ConvertVideoToTextState> {
  ConvertVideoRepo videoRepo;
  ConvertVideoToTextCubit(this.videoRepo) : super(ConvertVideoToTextInitial());

bool isRecord=false;
bool isSelect=false;
VideoPlayerController? videoController;
final ImagePicker picker = ImagePicker();
  String videoPath=" ";

TranslateVideoResponseBody? translateVideoResponseBody;
//function to record video from app
  Future<void> recordVideoInsideApp() async {
    emit(VideoPickLoading());

    try{
      final XFile? video = await picker.pickVideo(
        source: ImageSource.camera,
        maxDuration: const Duration(seconds: 6),
      );
      if (video != null) {
         videoPath = video.path;
        print("مسار الفيديو : $videoPath");
        emit(VideoPickSuccess(video.path));
        isRecord=true;
      } else {
        isRecord=false;
        emit(ConvertVideoToTextInitial());
        print("المستخدم كنسل التصوير");
      }
    }catch(error,stackTrace){
      emit(VideoPickError(message: "حدث خطا اثناء رفع الفيديو"));
      print("error in record video is $error");
    }
  }
// function to select video from gallery
  Future<void> pickVideoFromGallery() async {

    emit(VideoPickLoading());
   try{
     final XFile? video = await picker.pickVideo(
       source: ImageSource.gallery,
     );

     if (video != null) {
        videoPath = video.path;
       print("مسار الفيديو المختار: $videoPath");
       // _uploadVideoToBackEnd(videoPath);
       isSelect=true;
       emit(VideoPickSuccess(video.path));
     } else {
       isSelect=false;
       emit(ConvertVideoToTextInitial());
       print("المستخدم كنسل الاختيار");
     }
   }catch(error,stackTrace){
     emit(VideoPickError(message: "حدث خطا اثناء رفع الفيديو"));
    print("error in select video is $error");
   }
  }

  void initializeVideo(String path) async {
    // بنمسح القديم لو موجود
    await videoController?.dispose();

    videoController = VideoPlayerController.file(File(path));

    try {
      await videoController!.initialize();
      videoController!.play();
      videoController!.setLooping(true);
      emit(VideoReadyToPlay());
    } catch (e) {
      emit(VideoPickError(message: "حدث خطا اثناء رفع الفيديو"));
    }
  }

  void translateVideo()async{

    emit(TranslateVideoLoading());
    try{
      File fileToSend = File(videoPath);

     translateVideoResponseBody = await videoRepo.translateVideo(fileToSend);

     if(translateVideoResponseBody!.statusCode==200){
       emit(TranslateVideoSuccessfully(translateVideoResponseBody: translateVideoResponseBody!));
     }
     else{
       emit(TranslateVideoWithError(apiErrorModel: ApiErrorHandler.handle(translateVideoResponseBody)));
     }
    }catch(error,stackTrace){
      emit(TranslateVideoWithError(apiErrorModel: ApiErrorHandler.handle(error)));
      print("🚨🚨 أيرور الـ Translate الصريح هو: $error");
      print("📌 الـ StackTrace: $stackTrace");
    }
  }
}
