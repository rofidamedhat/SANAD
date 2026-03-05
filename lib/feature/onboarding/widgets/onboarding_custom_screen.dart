import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class OnboardingCustomScreen extends StatelessWidget {
  const OnboardingCustomScreen({super.key,
  required this.title,
    required this.image,
    required this.description
  });
  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Image.asset(image,)),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.font24Green69Bold
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyles.font15Gray85Regular,
          ),
        ),
      ],
    );
  }
}
