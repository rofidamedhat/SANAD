import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';

class CustomInputField extends StatelessWidget {
  final IconData icon;
  final String? hintText;
  final TextEditingController? controller;  

  const CustomInputField({
    super.key,
    required this.icon,
    this.hintText,
    this.controller, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(35),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(0, 2), 
          ),
        ],
      ),
      child: TextField(
        controller: controller, 
        decoration: InputDecoration(
          suffixIcon: Icon(icon, color: AppColors.green69),
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),
    );
  }
}