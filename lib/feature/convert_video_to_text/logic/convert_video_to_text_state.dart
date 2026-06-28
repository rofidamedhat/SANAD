part of 'convert_video_to_text_cubit.dart';

@immutable
sealed class ConvertVideoToTextState {}

final class ConvertVideoToTextInitial extends ConvertVideoToTextState {}

class VideoReadyToPlay extends ConvertVideoToTextState {}
class VideoPickLoading extends ConvertVideoToTextState {}
class VideoPickSuccess extends ConvertVideoToTextState {
  final String videoPath; // هنشيل المسار هنا ونباصيه للـ UI
  VideoPickSuccess(this.videoPath);
}
class VideoPickError extends ConvertVideoToTextState {
  String message;
  VideoPickError({required this.message});
}

class TranslateVideoLoading extends ConvertVideoToTextState{}
class TranslateVideoWithError extends ConvertVideoToTextState{

  ApiErrorModel apiErrorModel;
  TranslateVideoWithError({required this.apiErrorModel});
}

class TranslateVideoSuccessfully extends ConvertVideoToTextState{

  TranslateVideoResponseBody translateVideoResponseBody;

  TranslateVideoSuccessfully({required this.translateVideoResponseBody});
}