import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../feature/profile/data/model/profile_response_body.dart';
import '../../../feature/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit({required this.repository}) : super(ProfileInitial());

  // بيانات البروفايل
  String name = '';
  String email = '';
  String role = '';
  String profileImageUrl = '';

  /// تحميل البيانات من السيرفر
  Future<void> loadProfile() async {
    emit(ProfileLoading());

    try {
      final ProfileResponseBody response = await repository.getProfile();
      
      name = response.data.fullName;
      email = response.data.email;
      role = response.data.role;
      profileImageUrl = response.data.profileImageUrl;

      emit(ProfileLoaded());
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  /// تحديث البيانات محليًا بعد الرجوع من EditProfile
  void updateProfileData({
    String? newName,
    String? newEmail,
    String? newRole,
    String? newProfileImageUrl,
  }) {
    if (newName != null) name = newName;
    if (newEmail != null) email = newEmail;
    if (newRole != null) role = newRole;
    if (newProfileImageUrl != null) profileImageUrl = newProfileImageUrl;

    emit(ProfileLoaded());
  }

  /// تسجيل الخروج
  Future<void> logout(BuildContext context) async {
    // لو فيه أي بيانات تخزّنها محليًا ممكن تمسح هنا
    Navigator.of(context)
        .pushNamedAndRemoveUntil("/login", (route) => false);
    emit(ProfileInitial());
  }
}