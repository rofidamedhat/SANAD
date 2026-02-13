import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/edit_profile/logic/edit_profile_cubit.dart';

class EditProfileHeaderWidget extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;
  final EditProfileCubit cubit;

  const EditProfileHeaderWidget({
    super.key,
    required this.image,
    required this.onTap,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        /// الهيدر الأبيض مع نص العنوان
        ClipPath(
          clipper: _EditHeaderClipper(),
          child: Container(
            height: 180,
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 45),
            child: Text(
              "تعديل الملف الشخصي",
              style: TextStyles.font20WhiteSemiBold.copyWith(
                fontSize: 20,
                color: AppColors.green69,
              ),
            ),
          ),
        ),

        /// الصورة الشخصية مع زرار الكاميرا
        Positioned(
          bottom: -70,
          child: GestureDetector(
            onTap: onTap,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 214, 214, 214),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
  radius: 65,
  backgroundColor: AppColors.greenC2,
  backgroundImage: image != null 
      ? FileImage(image!) // لو اليوزر اختار صورة جديدة من الجاليري
      : (cubit.profileImageUrl != null && cubit.profileImageUrl!.isNotEmpty&&cubit.profileImageUrl != "null"  )
          ? NetworkImage("https://sanadapllication2025api.premiumasp.net${cubit.profileImageUrl}")
          : null, // لو مفيش لا دي ولا دي
  child: (image == null && (cubit.profileImageUrl == null || cubit.profileImageUrl!.isEmpty))
      ? const Icon(
          Icons.person,
          size: 70,
          color: AppColors.green69,
        )
      : null,

                  ),
                ),
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
                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _EditHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final curveDepth = size.height * 0.22;
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