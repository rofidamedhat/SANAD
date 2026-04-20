import 'package:flutter/material.dart';
import 'package:sanad/core/extensions/navigation.dart';

import '../../../../core/themeing/colors.dart';
import '../../../../core/themeing/text_styles.dart';

class ShareQuestionsAppBar extends StatelessWidget {
  const ShareQuestionsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      title: Text("مشاركة الاسألة", style: TextStyles.font26green69Bold),
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(Icons.arrow_back, color: AppColors.greenA4, size: 40),
      ),
    );
  }
}
