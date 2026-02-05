import 'package:flutter/material.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';

import '../../../../core/themeing/text_styles.dart';

class ResultTextCard extends StatelessWidget {
  final String text;
   ResultTextCard({super.key,
   required this.text
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.whitef5,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 25,
            offset: Offset(0, 12),
          ),
        ],
      ),
    child: text.isEmpty?emptyState():resultState() ,
    );
  }

  Widget emptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.description_outlined,
              color: AppColors.green69,
              size: 50, ),
          verticalSpace(20),
          Text(
            "سيظهر النص المحول هنا",
            style: TextStyles.font14Gray85SemiBold,
          ),
        ],
      ),
    );
  }

  Widget resultState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Icon(Icons.format_quote, color: AppColors.green69, size: 30),
        verticalSpace(10),
        Text(
          text,
          style: TextStyles.font18Black05Bold,
        ),
      ],
    );
  }
}
