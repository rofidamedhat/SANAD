
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/helper/strings.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/feature/convert_text_to_speech/logic/translate_audio_and_text_cubit.dart';
import 'package:sanad/feature/convert_text_to_speech/ui/widgets/record_button_listen.dart';
import 'package:sanad/feature/convert_text_to_speech/ui/widgets/result_text_card.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../../core/themeing/text_styles.dart';
class ConvertToTextBody extends StatefulWidget {
   ConvertToTextBody({super.key});

  @override
  State<ConvertToTextBody> createState() => _ConvertToTextBodyState();
}

class _ConvertToTextBodyState extends State<ConvertToTextBody> {
  //speech to text
  // SpeechToText _speechToText = SpeechToText();
  // bool _speechEnabled = false;
  // String _lastWords = 'test';
  // String _fullWord = '';
  // void _initSpeech() async {
  //   _speechEnabled = await _speechToText.initialize();
  //   setState(() {});
  // }
 @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //  // _initSpeech();
  // }
  // void _onSpeechResult(SpeechRecognitionResult result) {
  //   setState(() {
  //     _lastWords = result.recognizedWords;
  //     _fullWord += ' $_lastWords';
  //   });
  // }
  // void _startListening() async {
  //   if(_lastWords.isNotEmpty){
  //     _fullWord = _lastWords = '';
  //   }
  //   await _speechToText.listen(
  //       localeId: 'ar-EG',
  //       onResult: _onSpeechResult,
  //   );
  //   print("start listening");
  //   setState(() {});
  // }
  // void _stopListening() async {
  //   await _speechToText.stop();
  //   _lastWords = _fullWord;
  //   print("text is $_lastWords");
  // // _fullWord = _lastWords = '';
  //   setState(() {});
  // }

 final  record = AudioRecorder();
 String? filePath;
  late final copiedFile;
 Future<void> startRecording() async {
   if (await record.hasPermission()) {
     final dir = await getTemporaryDirectory();

     filePath = '${dir.path}/voice.m4a';

     await record.start(
       const RecordConfig(
         encoder: AudioEncoder.aacLc, // ده اللي بيطلع m4a
         bitRate: 128000,
         sampleRate: 44100,
       ),
       path: filePath!,
     );
   }
 }
 Future<String?> stopRecording() async {
   final path = await record.stop();
   if (path == null) return null;

   await Future.delayed(const Duration(milliseconds: 500));

   final original = File(path);
   final copiedFile = await original.copy(
     '${original.parent.path}/upload.m4a',
   );

   return copiedFile.path;
 }

 @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.green69,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greenC2,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                micFillIcon,
                width: 45,
                height: 45,
              ),
            ),
          ),
          onLongPressStart: (details) {
            // print(_speechEnabled);
            // if (_speechEnabled) {
            //   _startListening();
            // }
            startRecording();
          },
          onLongPressEnd: (details) async {
            print("file path is $filePath");
            final file = await stopRecording();
            if (file == null) return;

            context.read<TranslateAudioAndTextCubit>()
                .translateToText(file);
          },
        ),
        verticalSpace(20),
        Text("اضغط وابدأ التسجيل",
        style: TextStyles.font26green69Bold,
        ),
        verticalSpace(5),
        Text("سيتم تحويل كلامك تلقائيا الى نص",
        style: TextStyles.font14Gray85SemiBold,
        ),
        verticalSpace(40),
       // ResultTextCard(text: "text"),
        RecordButtonListen(),
      ],
    );
  }
}
