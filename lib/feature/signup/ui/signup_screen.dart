import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("اضافة حساب",
        style: TextStyles.font48SemiBold,
        ),
      ),
    );
  }
}
