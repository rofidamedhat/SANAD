import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/themeing/colors.dart';

import '../../../core/routing/routes.dart';

class ShareQuestionsScreen extends StatelessWidget {
  const ShareQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding:  EdgeInsets.symmetric(vertical: 40.h,horizontal: 10.w),
        child: SizedBox(
          height: 80.h,
          width: 80.w,
          child: FloatingActionButton(
              onPressed:(){
                context.pushNamed(Routes.addQuestionsScreen);
              },
            shape: CircleBorder(),
              backgroundColor: AppColors.green69,
              child: Icon(Icons.add,
              color: Colors.white,
                size: 35,
              ),
          ),
        ),
      ),
    );
  }
}
