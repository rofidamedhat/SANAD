import 'package:flutter/material.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/home_volunteer/ui/widget/vol_services_list.dart';
import 'package:sanad/feature/home_volunteer/ui/widget/volunteer_welcome_container.dart';

class HomeVolunteerScreen extends StatelessWidget {
  const HomeVolunteerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("المتطوعين", style: TextStyles.font22Black05Bold),
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
              VolunteerWelcomeContainer(),
              verticalSpace(30),
              Expanded(child: VolServicesList()),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
