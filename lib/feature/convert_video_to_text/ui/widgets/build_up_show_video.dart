import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/feature/convert_video_to_text/ui/widgets/build_up_load_video.dart';
import 'package:video_player/video_player.dart';

import '../../logic/convert_video_to_text_cubit.dart';

class BuildUpShowVideo extends StatefulWidget {
  const BuildUpShowVideo({super.key});

  @override
  State<BuildUpShowVideo> createState() => _BuildUpShowVideoState();
}

class _BuildUpShowVideoState extends State<BuildUpShowVideo> {
  @override
  Widget build(BuildContext context) {
    if (context.read<ConvertVideoToTextCubit>().videoController != null && context.read<ConvertVideoToTextCubit>().videoController!.value.isInitialized) {
      return Stack(
        alignment: Alignment.center,

        children: [
          // ويدجت الـ VideoPlayer المسؤولة عن عرض الفيديو
          AspectRatio(
            aspectRatio: context.read<ConvertVideoToTextCubit>().videoController!.value.aspectRatio,
            child: VideoPlayer(context.read<ConvertVideoToTextCubit>().videoController!),
          ),
          // زرار صغير "حذف" أو "تغيير الفيديو" لو حب يغيره
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  setState(() {
                   // context.read<ConvertVideoToTextCubit>().resetVideo();
                    context.read<ConvertVideoToTextCubit>().videoController?.dispose();
                    context.read<ConvertVideoToTextCubit>().videoController = null;
                    context.read<ConvertVideoToTextCubit>().isSelect=false;
                  });
                },
              ),
            ),
          ),
        ],
      );
    }
    else {
      return BuildUpLoadVideo();
    }
  }
}
