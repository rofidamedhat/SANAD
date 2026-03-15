import 'package:flutter/material.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/widgets/app_text_button.dart';

import '../../../../core/themeing/text_styles.dart';

class ShareQuestionsCardItemContent extends StatelessWidget {
  const ShareQuestionsCardItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              child: Image.asset('assets/images/volunteer_welcome_image.png',
              fit: BoxFit.cover,
              ),
              radius: 30,
            ),
            horizontalSpace(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("مريم سامي",
                style: TextStyles.font20BlackMedium,
                ),
                Text("منذ لحظات",
                  style: TextStyles.font15Gray85Regular,
                ),
              ],
            )
          ],
        ),
        verticalSpace(20),
        Text("اتعامل ازاي مع التنمر اللي بقابله ؟",
        style: TextStyles.font15Black05Regular,
        ),
        verticalSpace(25),
        Center(
          child: AppTextButton(
              buttonText: "تواصل الان",
              textStyle: TextStyles.font20WhiteMedium,
              onPressed: (){},
            buttonWidth: 161,
            borderRadius: 30,
          ),
        )
      ],
    );
  }
}
