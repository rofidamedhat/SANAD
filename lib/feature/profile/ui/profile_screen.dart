import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/feature/profile/logic/profile_cubit.dart';
import 'widget/profile_item.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/feature/home_volunteer/ui/widget/home_bottom_nav_bar.dart';
import 'package:sanad/core/themeing/colors.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit()..loadProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();

          return Scaffold(
  backgroundColor: Colors.white,
  appBar: AppBar(
    title: const Text(
      "الملف الشخصي",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    centerTitle: true,
    backgroundColor: AppColors.green69,
    elevation: 0,
  ),

  body: Stack(
    children: [
      ///  الشكل  اللي فوق
      Container(
        height: 160,
        decoration: const BoxDecoration(
          color: AppColors.green69,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),
      ),

      /// المحتوى كله
      SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 70),

            ///  صورة البروفايل في النص
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.greenC2,
                backgroundImage: cubit.profileImage != null
                    ? FileImage(cubit.profileImage!)
                    : null,
                child: cubit.profileImage == null
                    ? Icon(
                        Icons.person,
                        size: 50,
                        color: AppColors.green69,
                      )
                    : null,
              ),
            ),

            const SizedBox(height: 10),

            /// اسم المستخدم
            Text(
              cubit.name.isEmpty ? "اسم المستخدم" : cubit.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            /// بيانات البروفايل
            ProfileItem(
              title: "الاسم :",
              value: cubit.name.isEmpty ? "......" : cubit.name,
            ),
            const SizedBox(height: 10),

            ProfileItem(
              title: "الايميل :",
              value: cubit.email.isEmpty ? "......" : cubit.email,
            ),
            const SizedBox(height: 10),

            ProfileItem(
              title: "الفئة :",
              value: cubit.role.isEmpty ? "......" : cubit.role,
            ),

            const SizedBox(height: 15),

            /// زر التعديل
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.editProfileScreen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green69,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
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

            /// زر الخروج
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.logout,
                      color: Color.fromARGB(255, 250, 121, 121), size: 18),
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
        ),
      ),
    ],
  ),

  bottomNavigationBar: HomeBottomNavBar(),
);
        },
      ),
    );
  }
}