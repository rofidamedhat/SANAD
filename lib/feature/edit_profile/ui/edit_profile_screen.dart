import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanad/feature/profile/logic/profile_cubit.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import '../../../core/helper/spaces.dart';
import '../../../core/widgets/app_text_button.dart';
import 'package:sanad/feature/edit_profile/ui/widget/edit_profile_header_clipper.dart'; // الهيدر الجديد

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _croppedImage;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _roleController = TextEditingController();

  final double textFieldHeight = 60;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProfileCubit>();
    _nameController.text = cubit.name;
    _emailController.text = cubit.email;
    _roleController.text = cubit.role;
  }

  Future<void> _pickAndCropImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'تعديل الصورة',
          toolbarColor: AppColors.green69,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'تعديل الصورة',
          aspectRatioLockEnabled: true,
        ),
      ],
    );

    if (croppedFile != null) {
      setState(() {
        _croppedImage = File(croppedFile.path);
      });
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: const Color.fromARGB(255, 167, 224, 202).withOpacity(0.2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller, required String label}) {
    return SizedBox(
      height: textFieldHeight,
      width: double.infinity,
      child: TextField(
        controller: controller,
        decoration: _inputDecoration(label),
        style: TextStyles.font21GreenA4Regular,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// الهيدر زي البروفايل
            EditProfileHeaderWidget(
              image: _croppedImage,
              onTap: _pickAndCropImage,
            ),

            SizedBox(height: 90.h), // مساحة تحت الهيدر للـ TextFields

            // TextFields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildTextField(controller: _nameController, label: 'الاسم'),
                  verticalSpace(20),
                  _buildTextField(
                      controller: _emailController, label: 'الإيميل'),
                  verticalSpace(20),
                  _buildTextField(
                      controller: _roleController, label: 'الفئة'),
                  verticalSpace(40),

                  // زر تعديل الملف الشخصي
                  AppTextButton(
                    buttonText: " تعديل ",
                    textStyle: TextStyles.font20WhiteSemiBold,
                    onPressed: () {
                      cubit.updateProfile(
                        newName: _nameController.text,
                        newEmail: _emailController.text,
                        newRole: _roleController.text,
                      );
                      Navigator.pop(context);
                    },
                    backgroundColor: AppColors.green69,
                    buttonHeight: 55.h,
                    buttonWidth: double.infinity,
                    borderRadius: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}