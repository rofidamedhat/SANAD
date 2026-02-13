import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import '../../../../core/helper/spaces.dart';
import '../../../../core/widgets/app_text_button.dart';

class EditProfileForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController roleController;
  final bool isLoading;
  final VoidCallback onSave;

  const EditProfileForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.roleController,
    required this.isLoading,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLabeledField(title: "الاسم", controller: nameController),
        verticalSpace(15),
        _buildLabeledField(title: "البريد الالكتروني", controller: emailController),
        verticalSpace(15),
        _buildLabeledField(title: "الفئة", controller: roleController),
        verticalSpace(50),
        AppTextButton(
          buttonText: isLoading ? "جاري التعديل..." : " تعديل ",
          textStyle: TextStyles.font20WhiteSemiBold,
          onPressed: onSave,
          backgroundColor: AppColors.green69,
          buttonHeight: 55.h,
          buttonWidth: 150,
          borderRadius: 50,
        ),
      ],
    );
  }

  Widget _buildLabeledField({required String title, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title :",
          style: TextStyles.font21GreenA4Regular.copyWith(
            color: AppColors.green69,
            fontSize: 15.sp,
          ),
        ),
        verticalSpace(8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(184, 228, 227, 227),
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.03), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: TextField(
            controller: controller,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 14.sp, color: Colors.black87),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            ),
          ),
        ),
      ],
    );
  }
}