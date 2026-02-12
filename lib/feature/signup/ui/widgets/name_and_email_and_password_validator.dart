import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/feature/signup/logic/signup_cubit.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/themeing/colors.dart';
import '../../../../core/themeing/text_styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class NameAndEmailAndPasswordValidator extends StatefulWidget {
  const NameAndEmailAndPasswordValidator({super.key});

  @override
  State<NameAndEmailAndPasswordValidator> createState() =>
      _NameAndEmailAndPasswordValidatorState();
}

class _NameAndEmailAndPasswordValidatorState
    extends State<NameAndEmailAndPasswordValidator> {
  late TextEditingController name;
  late GlobalKey<FormState> formKey;
  late TextEditingController email;
  late TextEditingController password;
  bool isObscure = true;
  @override
  void initState() {
    super.initState();
    name = context.read<SignupCubit>().name;
    email = context.read<SignupCubit>().email;
    password = context.read<SignupCubit>().password;
    formKey = context.read<SignupCubit>().formKey;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "الاسم ",
            controller: name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "يرجى ادخال اسم المستخدم";
              }
            },
            hintStyle: TextStyles.font21GreenA4Regular,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.green69, width: 1.3),
              borderRadius: BorderRadius.circular(30.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.white, width: 1.3),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          verticalSpace(40),
          AppTextFormField(
            hintText: "البريد الالكتروني",
            controller: email,
            validator: (value) {
              if (value!.isEmpty || !AppRegex.isEmailValid(value)) {
                return "من فضلك ادخل بريد الكترونى صحيح";
              }
            },
            //controller: email,
            hintStyle: TextStyles.font21GreenA4Regular,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.green69, width: 1.3),
              borderRadius: BorderRadius.circular(30.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.white, width: 1.3),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          verticalSpace(40),
          AppTextFormField(
            hintText: "كلمة المرور ",
            controller: password,
            validator: (value) {
              if (value!.isEmpty || !AppRegex.isPasswordValid(value)) {
                return "يجب ان تحتوى كلمة المرور على حروف وارقام ورموز ";
              }
            },
            hintStyle: TextStyles.font21GreenA4Regular,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.green69, width: 1.3),
              borderRadius: BorderRadius.circular(30.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.white, width: 1.3),
              borderRadius: BorderRadius.circular(30.0),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                isObscure = !isObscure;
                setState(() {});
              },
              child: Icon(
                isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 22,
                color: AppColors.green69,
              ),
            ),
            isObscureText: isObscure,
          ),
        ],
      ),
    );
  }
}
