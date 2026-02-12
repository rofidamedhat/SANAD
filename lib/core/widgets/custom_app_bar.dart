import 'package:flutter/material.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/themeing/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(Icons.arrow_back, color: AppColors.greenA4, size: 30),
      ),
      iconTheme: const IconThemeData(color: AppColors.green69),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
