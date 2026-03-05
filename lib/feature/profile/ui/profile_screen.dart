import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/helper/spaces.dart';

import 'package:sanad/feature/profile/logic/profile_cubit.dart';
import 'package:sanad/feature/profile/data/repo/profile_repo.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/di/dependency_injection.dart';
import 'widget/profile_header.dart';
import 'widget/profile_info_section.dart';
import 'widget/profile_action_section.dart';

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