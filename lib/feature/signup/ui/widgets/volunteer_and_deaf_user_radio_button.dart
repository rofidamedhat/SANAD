import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/feature/signup/logic/signup_cubit.dart';

import '../../../../core/themeing/text_styles.dart';

class VolunteerAndDeafUserRadioButton extends StatefulWidget {
  const VolunteerAndDeafUserRadioButton({super.key});

  @override
  State<VolunteerAndDeafUserRadioButton> createState() =>
      _VolunteerAndDeafUserRadioButtonState();
}

class _VolunteerAndDeafUserRadioButtonState
    extends State<VolunteerAndDeafUserRadioButton> {
  @override
  void initState() {
    super.initState();
    // selectedOption=context.read<SignupCubit>().role;
  }

  String selectedOption = " ";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Column(
        children: [
          RadioListTile(
            title: Text("متطوع", style: TextStyles.font20Black05Regular),
            value: "Volunteer",
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
                context.read<SignupCubit>().role = selectedOption;
                print(context.read<SignupCubit>().role);
              });
            },
            activeColor: AppColors.green69,
          ),
          RadioListTile(
            title: Text("ذوى همم", style: TextStyles.font20Black05Regular),
            value: "DeafUser",
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
                context.read<SignupCubit>().role = selectedOption;
                print(context.read<SignupCubit>().role);
              });
            },
            activeColor: AppColors.green69,
          ),
        ],
      ),
    );
  }
}
