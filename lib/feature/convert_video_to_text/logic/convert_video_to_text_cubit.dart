import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:sanad/core/networking/api_error_handler.dart';
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

//function to record video from app
  Future<void> recordVideoInsideApp() async {
    emit(VideoPickLoading());

    try{
      final XFile? video = await picker.pickVideo(
        source: ImageSource.camera,
        maxDuration: const Duration(seconds: 6),
      );
      if (video != null) {
        String videoPath = video.path;
        print("مسار الفيديو : $videoPath");
        emit(VideoPickSuccess(video.path));
        isRecord=true;
      } else {
        isRecord=false;
        emit(ConvertVideoToTextInitial());
        print("المستخدم كنسل التصوير");
      }
    }catch(error,stackTrace){
      emit(VideoPickError(ApiErrorHandler.handle(error) as String));
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
       String videoPath = video.path;
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
    emit(VideoPickError(ApiErrorHandler.handle(error) as String));
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
      emit(VideoPickError(ApiErrorHandler.handle(e) as String));
    }
  }

}
