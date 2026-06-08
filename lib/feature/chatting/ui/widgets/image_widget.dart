import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/themeing/colors.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: AppColors.grayC1,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child:
            (imageUrl != null &&
                imageUrl!.isNotEmpty &&
                imageUrl != "null" &&
                imageUrl != "default")
            ? Image.network(
                "https://sanadapllication2025api.premiumasp.net${imageUrl ?? ''}",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    size: 30,
                    color: AppColors.green69,
                  );
                },
              )
            : const Icon(Icons.person, size: 30, color: Colors.red),
      ),
    );
  }
}
