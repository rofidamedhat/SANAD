import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class HomeVolunteerScreen extends StatelessWidget {
  const HomeVolunteerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Volunteer",
        style: TextStyles.font20Regular,
        ),
      ),
    );
  }
}
