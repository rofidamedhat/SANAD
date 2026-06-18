import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/core/widgets/app_text_button.dart';
import 'package:sanad/core/widgets/result_text_card.dart';
import 'package:sanad/feature/convert_video_to_text/ui/widgets/build_up_load_video.dart';
import 'package:sanad/feature/convert_video_to_text/ui/widgets/translate_video_to_text_app_bar.dart';
import 'package:sanad/feature/convert_video_to_text/ui/widgets/video_condition_item.dart';

class ConvertVideoToTextScreen extends StatefulWidget {
  const ConvertVideoToTextScreen({super.key});

  @override
  State<ConvertVideoToTextScreen> createState() =>
      _ConvertVideoToTextScreenState();
}

class _ConvertVideoToTextScreenState extends State<ConvertVideoToTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: TranslateVideoToTextAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
              child: BuildUpLoadVideo(),
            ),
            verticalSpace(15),
            Text("شروط الفيديو", style: TextStyles.font18Black05Bold),
            verticalSpace(20),
            VideoConditionItem(
              text: "أن تكون مدة الفيديو لا تزيد عن 6 ثوانى",
              icon: Icons.video_call_outlined,
            ),
            VideoConditionItem(
              text: "أن تكون حركة اليدين واضحه داخل اطار الكاميرا",
              icon: Icons.front_hand_outlined,
            ),
            verticalSpace(20),
            ResultTextCard(text: ""),
            verticalSpace(10),
            Center(
              child: AppTextButton(
                buttonText: "تحويل الفيديو",
                textStyle: TextStyles.font20WhiteMedium,
                onPressed: () {},
                buttonWidth: 200,
                 borderRadius: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
