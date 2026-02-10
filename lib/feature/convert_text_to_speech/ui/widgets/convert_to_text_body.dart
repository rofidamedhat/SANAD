import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/helper/strings.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/feature/convert_text_to_speech/ui/widgets/result_text_card.dart';
import '../../../../core/themeing/text_styles.dart';

class ConvertToTextBody extends StatefulWidget {
   ConvertToTextBody({super.key});

  @override
  State<ConvertToTextBody> createState() => _ConvertToTextBodyState();
}

class _ConvertToTextBodyState extends State<ConvertToTextBody> {
 String text="";
// final Record record = Record();
 // Future<void> startRecording() async {
 //   if (await record.hasPermission()) {
 //     await record.start(
 //       RecordConfig(
 //         encoder: AudioEncoder.mp3,
 //         bitRate: 128000,
 //         sampleRate: 44100,
 //       ), path: '',
 //     );
 //   }
 // }
 // Future<String?> stopRecording() async {
 //   final path = await record.stop();
 //   return path; // ده مسار ملف mp3
 // }
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
          onTap: (){
            setState(() {
              text="";
            });
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
         ResultTextCard(text: text)
      ],
    );
  }
}
