import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/convert_video_to_text/logic/convert_video_to_text_cubit.dart';
import 'package:video_player/video_player.dart';

class SelectVideoButton extends StatefulWidget {
  const SelectVideoButton({super.key});

  @override
  State<SelectVideoButton> createState() => _SelectVideoButtonState();
}

class _SelectVideoButtonState extends State<SelectVideoButton> {
  @override
  //VideoPlayerController? videoController;

  // void initializeVideo(String path) {
  //  //context.read<ConvertVideoToTextCubit>().videoController?.dispose();
  //
  //  context.read<ConvertVideoToTextCubit>(). videoController = VideoPlayerController.file(File(path))
  //     ..initialize().then((_) {
  //       setState(() {}); // بتعمل ريفريش هنا عادي لأننا جوه الـ UI
  //       context.read<ConvertVideoToTextCubit>(). videoController?.play();
  //       context.read<ConvertVideoToTextCubit>().videoController?.setLooping(true);
  //     });
  // }

  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.read<ConvertVideoToTextCubit>().pickVideoFromGallery();
      },
      icon: Icon(Icons.drive_folder_upload_rounded, size: 25,
        color: AppColors.green69,),
      label: Text(
        "اختيار فيديو",
        style: TextStyles.font16Green69Medium,
      ),
      style: ElevatedButton.styleFrom(
        //backgroundColor: AppColors.green69,
        foregroundColor: Colors.white,
        side: BorderSide(color: AppColors.grayC1, width: 1.5.w),
        padding: EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
    );
  }
}
