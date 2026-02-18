import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/edit_profile/logic/edit_profile_cubit.dart';
import 'edit_profile_header_clipper.dart';

class EditProfileHeaderWidget extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;
  final EditProfileCubit cubit;
  final String? imageUrl; 

  const EditProfileHeaderWidget({
    super.key,
    required this.image,
    required this.onTap,
    required this.cubit,
    this.imageUrl, 
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        ClipPath(
          clipper: EditHeaderClipper(),
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
                        ? FileImage(image!)  
                        : (imageUrl != null && imageUrl!.isNotEmpty && imageUrl != "null")
                            ? NetworkImage("https://sanadapllication2025api.premiumasp.net$imageUrl") 
                            : null,
                    child: (image == null && (imageUrl == null || imageUrl!.isEmpty))
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
                        offset: const Offset(0, 3),
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
