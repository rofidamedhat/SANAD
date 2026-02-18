import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanad/core/di/dependency_injection.dart';
import 'package:sanad/core/themeing/colors.dart';
import '../logic/edit_profile_cubit.dart';
import '../../profile/logic/profile_cubit.dart'; 
import 'widget/edit_profile_header.dart';
import 'widget/edit_profile_form.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditProfileCubit(getIt())..loadInitialData(),
      child: const _EditProfileView(),
    );
  }
}

class _EditProfileView extends StatefulWidget {
  const _EditProfileView();
  @override
  State<_EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<_EditProfileView> {
  final ImagePicker _picker = ImagePicker();
  File? _croppedImage;
  late TextEditingController _nameController, _emailController, _roleController;

  @override
  void initState() {
    super.initState();
    final profileCubit = context.read<ProfileCubit>();
    
    _nameController = TextEditingController(text: profileCubit.name);
    _emailController = TextEditingController(text: profileCubit.email);
    _roleController = TextEditingController(text: profileCubit.role);
  }

  Future<void> _pickAndCropImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    if (croppedFile != null) setState(() => _croppedImage = File(croppedFile.path));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileSuccess) {
            context.read<ProfileCubit>().loadProfile();
            
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("تم تحديث الملف الشخصي بنجاح",
              style: TextStyle(color: AppColors.black05)),
              backgroundColor: AppColors.gray,
            ));
            Navigator.pop(context);
          }
          if (state is EditProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: const Color.fromARGB(255, 250, 194, 190),
            ));
          }
        },
        builder: (context, state) {
          final isLoading = state is EditProfileLoading;
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                   EditProfileHeaderWidget(
  image: _croppedImage,
  onTap: _pickAndCropImage,
  cubit: context.read<EditProfileCubit>(),
  imageUrl: context.read<ProfileCubit>().profileImageUrl,
),
                    const SizedBox(height: 120),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: EditProfileForm(
                        nameController: _nameController,
                        emailController: _emailController,
                        roleController: _roleController,
                        isLoading: isLoading,
                        onSave: () => context.read<EditProfileCubit>().updateProfile(
                          name: _nameController.text,
                          email: _emailController.text,
                          role: _roleController.text,
                          image: _croppedImage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading)
                Container(
                  color: Colors.black12,
                  child: const Center(child: CircularProgressIndicator(color: AppColors.green69)),
                ),
            ],
          );
        },
      ),
    );
  }
}