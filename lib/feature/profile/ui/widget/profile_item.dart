import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const ProfileItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,


  });

  @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 16,
        ),

        const SizedBox(width: 8),

        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: AppColors.green69,
            fontWeight: FontWeight.normal,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    ),
  );
}
}