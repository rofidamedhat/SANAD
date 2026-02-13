import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';
import '../../logic/profile_cubit.dart';
import 'profile_item.dart';

class ProfileInfoSection extends StatelessWidget {
  final ProfileCubit cubit;

  const ProfileInfoSection({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          const SizedBox(height: 25),
      
          ProfileItem(
            title: "الاسم :",
            value: cubit.name.isEmpty ? "......" : cubit.name,
            icon: Icons.person,
            color: AppColors.greenC2,
          ),
      
          const SizedBox(height: 8),
      
          ProfileItem(
            title: "الايميل :",
            value: cubit.email.isEmpty ? "......" : cubit.email,
            icon: Icons.email,
            color: AppColors.greenC2,
          ),
      
          const SizedBox(height: 8),
      
          ProfileItem(
            title: "الفئة :",
            value: cubit.role.isEmpty ? "......" : cubit.role,
            icon: Icons.group,
            color: AppColors.greenC2,
          ),
        ],
      ),
    );
  }
}