import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key,required this.active});
  final bool active;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active ? AppColors.green69 : Colors.grey,
      ),
      width: active ? 20 : 10,
      height: 10,
    );
  }
}
