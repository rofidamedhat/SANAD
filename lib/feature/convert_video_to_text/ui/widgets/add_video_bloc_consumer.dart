import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/extensions/navigation.dart';

import '../../../../core/themeing/colors.dart';
import '../../logic/convert_video_to_text_cubit.dart';
import 'build_up_load_video.dart';
import 'build_up_show_video.dart';

class AddVideoBlocConsumer extends StatelessWidget {
  const AddVideoBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConvertVideoToTextCubit, ConvertVideoToTextState>(
      listener: (context, state) {
        if (state is VideoPickLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.green69,
              ),
            ),
          );
        } else if (state is VideoPickSuccess) {
          context.pop(); // قفل الـ dialog
          // بنادي على الـ initialize جوه الكيوبت
          context.read<ConvertVideoToTextCubit>().initializeVideo(
            state.videoPath,
          );
        } else if (state is VideoPickError) {
          context.pop(); // قفل الـ dialog لو حصل أيرور
        }
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.greenC2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child:state is VideoReadyToPlay
              ? BuildUpShowVideo()
              : BuildUpLoadVideo(),
        );
      },
    );
  }
}
