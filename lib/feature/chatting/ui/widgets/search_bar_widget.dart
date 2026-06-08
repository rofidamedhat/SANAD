import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 50.h,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 240, 240),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'بحث في الدردشة',
                  hintStyle: TextStyles.font16greyBold,
                  border: InputBorder.none,
                ),
              ),
            ),
            horizontalSpace(10),
            const Icon(Icons.search, color: Colors.grey, size: 30),
          ],
        ),
      ),
    );
  }
}
