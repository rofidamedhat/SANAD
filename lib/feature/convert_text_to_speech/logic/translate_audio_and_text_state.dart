part of 'translate_audio_and_text_cubit.dart';

@immutable
sealed class TranslateAudioAndTextState {}

final class TranslateAudioAndTextInitial extends TranslateAudioAndTextState {}

//TranslateTextState
class TranslateTextLoading extends TranslateAudioAndTextState{}
class TranslateTextWithError extends TranslateAudioAndTextState{

  ApiErrorModel apiErrorModel;
  TranslateTextWithError({required this.apiErrorModel});
}

class TranslateTextWithSuccessfully extends TranslateAudioAndTextState{

  AudioResponseBody audioResponseBody;
  TranslateTextWithSuccessfully({required this.audioResponseBody});
}
