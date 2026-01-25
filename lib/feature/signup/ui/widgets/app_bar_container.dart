import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/helper/strings.dart';
import 'package:sanad/core/themeing/text_styles.dart';

import '../../../../core/themeing/colors.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      decoration: BoxDecoration(
        color: AppColors.mainGreen,
        borderRadius:BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("لدينا بطل جديد ",
          style:TextStyles.font36BaseWhiteSemiBold ,
          ),
          SvgPicture.asset(signupIcon,
          )
        ],
      ),
    );
  }
}
