import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/feature/convert_text_to_speech/logic/translate_audio_and_text_cubit.dart';
import 'package:sanad/feature/convert_text_to_speech/ui/widgets/result_text_card.dart';

import '../../../../core/constants.dart';
import '../../../../core/themeing/colors.dart';

class RecordButtonListen extends StatelessWidget {
  const RecordButtonListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TranslateAudioAndTextCubit,TranslateAudioAndTextState>(
        buildWhen: (_, current) => current is TranslateAudioSuccessfully,
        builder: (context, state) {
          if (state is TranslateAudioSuccessfully) {
            return ResultTextCard(
              text: state.audioResponseBody.data, // 👈 الأفضل من cubit.text
            );
          }
          // فاضي طول ما مش Success
          else {
            return ResultTextCard(text: "");
          }
        },
        listener: (context,state){
                if(state is TranslateAudioLoading){
                  showDialog(
                    context: context,
                    builder: (context) => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.green69,
                      ),
                    ),
                  );
                }
                else if(state is TranslateAudioWithError){
                  print("Error...");
                  setupErrorState(context,state.apiErrorModel.message!);
                }
            else if(state is TranslateAudioSuccessfully){
            context.pop();
            print(state);
         }
        }
    );
    // return BlocListener<TranslateAudioAndTextCubit,TranslateAudioAndTextState>(
    //     listener: (context,state){
    //       if(state is TranslateAudioLoading){
    //         showDialog(
    //           context: context,
    //           builder: (context) => Center(
    //             child: CircularProgressIndicator(
    //               color: AppColors.green69,
    //             ),
    //           ),
    //         );
    //       }
    //       else if(state is TranslateAudioWithError){
    //         print("Error...");
    //         setupErrorState(context,state.apiErrorModel.message!);
    //       }
    //       else if(state is TranslateAudioSuccessfully){
    //         context.pop();
    //         print(state);
    //         context.read<TranslateAudioAndTextCubit>().text=state.audioResponseBody.data;
    //       }
    //     },
    //   child: SizedBox.shrink()
    // );
  }
}
