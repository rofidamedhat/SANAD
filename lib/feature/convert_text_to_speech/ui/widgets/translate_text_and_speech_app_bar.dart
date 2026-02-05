import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';

import '../../../../core/helper/spaces.dart';

class TranslateTextAndSpeechAppBar extends StatelessWidget {
  const TranslateTextAndSpeechAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        flexibleSpace:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 65.h,
                left: 20.h
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "ترجمة النص والصوت",
                    style: TextStyles.font26green69Bold,
                  ),
                  verticalSpace(10),
                  Text(
                    "حول كلامك لنص او اسمع النص بصوت واضح",
                    style: TextStyles.font14Gray85SemiBold,
                  )
                ],
              ),
            ),
            horizontalSpace(30),
            Padding(
              padding:  EdgeInsets.only(
                  left: 10.h
              ),
              // child: Container(
              //   height: 40.h,
              //   width: 40.w,
              //   child: IconButton(
              //       onPressed: () {
              //         context.pop();
              //       },
              //       icon: Icon(
              //         Icons.arrow_forward,
              //         size: 35,
              //         color: ColorsManager.black,
              //       )),
              // ),
            ),
          ],
        ),
        leading:SizedBox()
    );;
  }
}
