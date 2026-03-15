import 'package:flutter/material.dart';
import 'package:sanad/core/extensions/navigation.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/themeing/colors.dart';

class FloatingActionButtonDesign extends StatelessWidget {
  const FloatingActionButtonDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: () {
        context.pushNamed(Routes.addQuestionsScreen);
      },
      shape: CircleBorder(),
      backgroundColor: AppColors.green69,
      child: Icon(Icons.add, color: Colors.white, size: 35),
    );
  }
}
