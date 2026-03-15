import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/feature/share_question/ui/widgets/share_questions_card_item_content.dart';

class ShareQuestionsCardItem extends StatelessWidget {
  const ShareQuestionsCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.lighterGray,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:AppColors.grayC1,
            blurRadius: 25,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child:ShareQuestionsCardItemContent() ,
    );
  }
}
