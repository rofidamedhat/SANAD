import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/helper/strings.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/convert_text_to_speech/logic/translate_audio_and_text_cubit.dart';
import 'package:sanad/feature/convert_text_to_speech/ui/widgets/sound_button_listen.dart';
import 'package:sanad/feature/convert_text_to_speech/ui/widgets/text_to_speech_input_field.dart';

import '../../../../core/constants.dart';
import '../../../../core/helper/spaces.dart';
import '../../../../core/themeing/colors.dart';

class ConvertToSpeechBody extends StatefulWidget {
  const ConvertToSpeechBody({super.key});

  @override
  State<ConvertToSpeechBody> createState() => _ConvertToSpeechBodyState();
}

class _ConvertToSpeechBodyState extends State<ConvertToSpeechBody> {
  @override
  TextEditingController controller=TextEditingController();
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.whitef5,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 25,
            offset: Offset(0, 12),
          ),
        ],
      ),
        child: TextToSpeechInputField(controller:controller),
    ),
        verticalSpace(20),
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
                soundIcon,
                width: 45,
                height: 45,
              ),
            ),
          ),
          //behavior: HitTestBehavior.opaque,
          onTap: (){
            setState(() {
            });
            if(controller.text.isEmpty){
              setupErrorState(context, "لا يمكن ارسال نص فارغ");
            }
            else{
              context.read<TranslateAudioAndTextCubit>().translateText(jsonEncode(controller.text));
            }
            print("on tap");

          },
        ),
        verticalSpace(20),
        Text("اضغط واستمع إلى الصوت",
          style: TextStyles.font26green69Bold,
        ),
        verticalSpace(5),
        Text("سيتم تحويل النص تلقائيا الى صوت",
          style: TextStyles.font14Gray85SemiBold,
        ),
        SoundButtonListen()
      ],
    );
  }
}
