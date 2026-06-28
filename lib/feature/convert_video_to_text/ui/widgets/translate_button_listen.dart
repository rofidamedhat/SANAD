import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/feature/convert_video_to_text/logic/convert_video_to_text_cubit.dart';

import '../../../../core/constants.dart';
import '../../../../core/themeing/colors.dart';
import '../../../../core/widgets/result_text_card.dart';

class TranslateButtonListen extends StatelessWidget {
  const TranslateButtonListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConvertVideoToTextCubit,ConvertVideoToTextState>(
        buildWhen: (_, current) => current is TranslateVideoSuccessfully,
        builder: (context,state){
          if (state is TranslateVideoSuccessfully) {
            return ResultTextCard(
              text: state.translateVideoResponseBody.data.sentence, // 👈 الأفضل من cubit.text
            );
          }
          // فاضي طول ما مش Success
          else {
            return ResultTextCard(text: "");
          }
        },
        listener: (context,state){
          if(state is TranslateVideoLoading){
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.green69,
                ),
              ),
            );
          }
          else if(state is TranslateVideoWithError){
            print("Error...");
            setupErrorState(context,state.apiErrorModel.message!);
          }
          else if(state is TranslateVideoSuccessfully){
            context.pop();
            print(state);
          }
        }
    );
  }
}
