import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/feature/convert_text_to_speech/logic/translate_audio_and_text_cubit.dart';

import '../../../../core/constants.dart';
import '../../../../core/themeing/colors.dart';
import '../../../../core/themeing/text_styles.dart';

class SoundButtonListen extends StatelessWidget {
  const SoundButtonListen({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return BlocListener<TranslateAudioAndTextCubit,TranslateAudioAndTextState>(
        listener: (context,state) async {
          if(state is TranslateTextLoading){
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.green69,
                ),
              ),
            );
          }

          else if(state is TranslateTextWithSuccessfully){
            context.pop();
            print("message from response is ${state.audioResponseBody.message}");
            await player.play(UrlSource('https://sanadapllication2025api.premiumasp.net${state.audioResponseBody.data}'));
          }
          else if (state is TranslateTextWithError){
            print("Error...");
           // print('https://sanadapllication2025api.premiumasp.net${state.audioResponseBody.data}');
            setupErrorState(context,state.apiErrorModel.message!);
          }
        },
        child:SizedBox.shrink()
    );
  }


}
