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
  final String message;
  VideoPickError(this.message);
}