import 'package:flutter/material.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/home_deaf_user/ui/widget/deaf_services_list.dart';
import 'package:sanad/feature/home_deaf_user/ui/widget/deaf_welcome_container.dart';
import 'package:sanad/feature/home_volunteer/ui/widget/home_bottom_nav_bar.dart';

import '../../../core/themeing/colors.dart';

class HomeDeafUserScreen extends StatelessWidget {
  const HomeDeafUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ابطال الصم وبكم", style: TextStyles.font22Black05Bold),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: AppColors.greenA4, size: 30),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DeafWelcomeContainer(),
              verticalSpace(30),
              Expanded(child: DeafServicesList()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
