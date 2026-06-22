import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/di/dependency_injection.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/feature/profile/logic/profile_cubit.dart';

import 'widget/profile_action_section.dart';
import 'widget/profile_header.dart';
import 'widget/profile_info_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileCubit>()..loadProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();

          if (state is ProfileLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator(color: AppColors.green69)),
            );
          }

          if (state is ProfileError) {
            if (state.message.contains('401')) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.lock_reset_rounded,
                          size: 90,
                          color: Colors.grey,
                        ),
                        verticalSpace(20),
                        const Text(
                          "حدث خطأ في السيرفر قم بتسجيل الدخول مرة أخرى",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        verticalSpace(30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, 
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.loginScreen, 
                              (route) => false,
                            );
                          },
                          child: const Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Scaffold(
              body: Center(child: Text("حدث خطأ: ${state.message}")),
            );
          }

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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileHeader(
                    name: cubit.name,
                    imageUrl: cubit.profileImageUrl,
                  ),
                  ProfileInfoSection(cubit: cubit),
                  verticalSpace(50),
                  ProfileActionsSection(cubit: cubit),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
