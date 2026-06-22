import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/core/widgets/app_text_button.dart';
import 'package:sanad/feature/convert_video_to_text/ui/widgets/record_video_button.dart';
import 'package:sanad/feature/convert_video_to_text/ui/widgets/select_video_button.dart';

class BuildUpLoadVideo extends StatelessWidget {
  const BuildUpLoadVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Icon(Icons.video_library, size: 50, color: AppColors.green69),
         verticalSpace(12),
         Text("ارفع فيديو لغة الإشارة هنا",
             style: TextStyles.font18Black05Bold,),
         Text("سيتم تحويله إلى نص",
         style: TextStyles.font14Gray85SemiBold,
         ),
       verticalSpace(16),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              Expanded(
                child: SelectVideoButton(),
              ),
              horizontalSpace(15),
              Expanded(child:RecordVideoButton() )
            ],
          ),
        )

      ],
    );
  }
}
