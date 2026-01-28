import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final String? imagePath;
  final Function() onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(0.18), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 12,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.font18Black05Bold,
            ),
            verticalSpace(10),
            imagePath != null
                ? SvgPicture.asset(imagePath!, height: 45, color: iconColor)
                : Icon(icon, size: 40, color: iconColor),
          ],
        ),
      ),
    );
  }
}
