import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helper/spaces.dart';
import '../../../../core/themeing/text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';

class ShimmerCardItemLoading extends StatelessWidget {
  const ShimmerCardItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            horizontalSpace(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(width: 120, height: 20, color: Colors.white),
                ),
                verticalSpace(8),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 80,
                    height: 15,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
        verticalSpace(20),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: double.infinity,
            height: 15,
            color: Colors.white,
          ),
        ),
        verticalSpace(25),
        Center(
          child: AppTextButton(
            buttonText: "تواصل الان",
            textStyle: TextStyles.font20WhiteMedium,
            onPressed: () {},
            buttonWidth: 161,
            borderRadius: 30,
          ),
        )
      ],
    );
  }
}
