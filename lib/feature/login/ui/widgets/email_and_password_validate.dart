import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/login/logic/login_cubit.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/themeing/colors.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class EmailAndPasswordValidator extends StatefulWidget {
  const EmailAndPasswordValidator({super.key});

  @override
  State<EmailAndPasswordValidator> createState() =>
      _EmailAndPasswordValidatorState();
}

class _EmailAndPasswordValidatorState extends State<EmailAndPasswordValidator> {
  @override
  void initState() {
    super.initState();
    email = context.read<LoginCubit>().emailController;
    password = context.read<LoginCubit>().passwordController;
    // formKey=context.read<LoginCubit>().formKey;
  }

  late TextEditingController email;
  late TextEditingController password;
  //late  GlobalKey<FormState> formKey;
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    print("FORM BUILD IS RUNNING");
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppTextFormField(
              hintText: "البريد الالكتروني",
              validator: (value) {
                if (value!.isEmpty || !AppRegex.isEmailValid(value)) {
                  return "من فضلك ادخل بريد الكترونى صحيح";
                }
              },
              controller: email,
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
            verticalSpace(30),
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
      ),
    );
  }
}
