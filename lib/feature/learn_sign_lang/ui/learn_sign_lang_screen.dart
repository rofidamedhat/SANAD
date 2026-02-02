import 'package:flutter/material.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/learn_sign_lang/ui/widget/learning_list.dart';

class LearnSignLangScreen extends StatelessWidget {
  const LearnSignLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: AppColors.greenA4, size: 30),
        ),
        iconTheme: const IconThemeData(color: AppColors.green69),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('تعلم لغة الإشارة', style: TextStyles.font26green69Bold),
            verticalSpace(10),
            Text(
              'خطوه بخطوه للتواصل بدون حواجز ',
              style: TextStyles.font22greySemiBold,
            ),
            Icon(
              Icons.favorite,
              color: const Color.fromARGB(255, 134, 187, 183),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 30,
                ),
                child: LearningList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
