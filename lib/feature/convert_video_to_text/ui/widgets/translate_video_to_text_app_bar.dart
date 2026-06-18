import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/extensions/navigation.dart';

import '../../../../core/helper/spaces.dart';
import '../../../../core/themeing/colors.dart';
import '../../../../core/themeing/text_styles.dart';

class TranslateVideoToTextAppBar extends StatelessWidget {
  const TranslateVideoToTextAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(top: 65.h, left: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("تحويل الفيديو الى نص", style: TextStyles.font26green69Bold),
                verticalSpace(7),
                Text(
                  "فيديو لغه اشاره بدون صوت",
                  style: TextStyles.font14Gray85SemiBold,
                ),
              ],
            ),
          ),
          horizontalSpace(30),
          Padding(
            padding: EdgeInsets.only(left: 30.h),
          ),
        ],
      ),
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(Icons.arrow_back, color: AppColors.greenA4, size: 30),
      ),
      iconTheme: const IconThemeData(color: AppColors.green69),
    );
  }
}
