import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class EditProfileHeaderWidget extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;

  const EditProfileHeaderWidget({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        /// 🔵 الهيدر الأزرق مع نص الانحناء الديناميكي
        ClipPath(
          clipper: _EditHeaderClipper(),
          child: Container(
            height: 180, // ارتفاع الهيدر
            width: double.infinity,
            color: AppColors.green69,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 45),
            child: Text(
              "تعديل الملف الشخصي",
              style: TextStyles.font20WhiteSemiBold.copyWith(fontSize: 20),
            ),
          ),
        ),

        /// 🟢 الصورة مع البوردر + زرار الكاميرا
        Positioned(
          bottom: -70,
          child: GestureDetector(
            onTap: onTap,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                /// الصورة + بوردر أبيض
                Container(
                  padding: const EdgeInsets.all(5), // سمك البوردر
                  decoration: const BoxDecoration(
                    color: Colors.white, // لون البوردر
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: AppColors.greenC2,
                    backgroundImage:
                        image != null ? FileImage(image!) : null,
                    child: image == null
                        ? const Icon(
                            Icons.person,
                            size: 40,
                            color: AppColors.green69,
                          )
                        : null,
                  ),
                ),

                /// زرار الكاميرا الصغير
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.green69,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// الكليبر ديناميكي حسب ارتفاع الهيدر
class _EditHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final curveDepth = size.height * 0.22; // نسبة الانحناء

    Path path = Path();
    path.lineTo(0, size.height - curveDepth);

    path.quadraticBezierTo(
      size.width / 2,
      size.height + curveDepth,
      size.width,
      size.height - curveDepth,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}