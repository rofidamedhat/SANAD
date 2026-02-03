import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;

  const ProfileItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // مسافة بسيطة بين كل Item
      child: Row(
        children: [
          // الـ Title
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.green69,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(width: 10), // مسافة صغيرة بين الـ title والقيمة
          // القيمة
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.right, // القيمة تظهر على اليمين
            ),
          ),
        ],
      ),
    );
  }
}