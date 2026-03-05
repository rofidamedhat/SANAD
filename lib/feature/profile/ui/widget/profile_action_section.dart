import 'package:flutter/material.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/routing/routes.dart';
import '../../logic/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/feature/edit_profile/ui/edit_profile_screen.dart';

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
        verticalSpace(30),

ElevatedButton(
  onPressed: () async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: cubit,
          child: const EditProfileScreen(), 
        ),
      ),
    );
    cubit.loadProfile();
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.green69,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 38),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
  ),
  child:  Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.edit, color: Colors.white, size: 18),
      horizontalSpace(10),
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

        verticalSpace(10),

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