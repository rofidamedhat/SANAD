import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/home_volunteer/ui/home_volunteer_screen.dart';

part 'widgets/_navigation_bar_item.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;

  List<Map<String, dynamic>> navigationItems = [
    {'title': 'الرئيسية', 'assetName': 'assets/svgs/home.svg'},
    {'title': 'المحادثات', 'assetName': 'assets/svgs/chat.svg'},
    {'title': 'حسابي', 'assetName': 'assets/svgs/user.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: [
           const HomeVolunteerScreen(),
            Center(child: Text('المحادثات')),
            Center(child: Text('حسابي')),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 92.h,
        padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 26.h),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: navigationItems.asMap().entries.map<Widget>((MapEntry e) {
            int index = e.key;
            Map value = e.value;
            return _NavigationBarItem(
              title: value['title'],
              assetName: value['assetName'],
              isSelected: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
