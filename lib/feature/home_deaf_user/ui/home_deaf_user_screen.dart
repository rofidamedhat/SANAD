import 'package:flutter/material.dart';

import '../../../core/themeing/colors.dart';

class HomeDeafUserScreen extends StatelessWidget {
  const HomeDeafUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home Deaf User",
          style:TextStyle(
              color: AppColors.baseBlack,
              fontSize: 40
          ),
        ),
      ),
    );
  }
}
