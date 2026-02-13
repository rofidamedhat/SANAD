import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/routing/routes.dart';
import '../../logic/profile_cubit.dart';

class ProfileActionsSection extends StatelessWidget {
  final ProfileCubit cubit;

  const ProfileActionsSection({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),

        /// زر التعديل
        ElevatedButton(
          onPressed: () async {
            // 1. الانتقال لشاشة التعديل والانتظار حتى يتم إغلاقها (Pop)
            await Navigator.pushNamed(context, Routes.editprofile);
            
            // 2. عند العودة، نطلب من الكيوبيت تحميل البيانات الجديدة من السيرفر
            // هذا سيؤدي لظهور الـ CircularProgressIndicator لثوانٍ ثم ظهور الداتا الجديدة
            cubit.loadProfile();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green69,
            padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 38),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.edit, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(
                "تعديل الملف الشخصي",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 5),

        /// زر تسجيل الخروج
        ElevatedButton(
          onPressed: () => cubit.logout(context),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color.fromARGB(255, 252, 208, 202),
            padding:
                const EdgeInsets.symmetric(vertical: 9, horizontal: 65),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.logout,
                  color: Color.fromARGB(255, 250, 121, 121),
                  size: 18),
              SizedBox(width: 8),
              Text(
                "تسجيل الخروج",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 250, 121, 121),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}