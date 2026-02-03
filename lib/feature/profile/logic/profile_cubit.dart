import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../core/helper/shared_pref_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  String name = '';
  String email = '';
  String phone = '';
  String role = '';
  File? profileImage; // صورة البروفايل

  /// تحميل البيانات من SharedPref
  Future<void> loadProfile() async {
    name = await SharedPrefHelper.getString("name") ?? '';
    email = await SharedPrefHelper.getString("email") ?? '';
    phone = await SharedPrefHelper.getString("phone") ?? '';
    role = await SharedPrefHelper.getString("role") ?? '';
    // لو خزنت الصورة قبل كده ممكن تضيفها
    emit(ProfileLoaded());
  }

  /// تحديث الصورة
  void updateProfileImage(File newImage) {
    profileImage = newImage;
    emit(ProfileLoaded());
  }

  /// تحديث البيانات
  Future<void> updateProfile({
    String? newName,
    String? newEmail,
    String? newPhone,
    String? newRole,
  }) async {
    if (newName != null) {
      name = newName;
      await SharedPrefHelper.setString("name", newName);
    }
    if (newEmail != null) {
      email = newEmail;
      await SharedPrefHelper.setString("email", newEmail);
    }
    if (newPhone != null) {
      phone = newPhone;
      await SharedPrefHelper.setString("phone", newPhone);
    }
    if (newRole != null) {
      role = newRole;
      await SharedPrefHelper.setString("role", newRole);
    }
    emit(ProfileLoaded());
  }

  /// تسجيل خروج
  Future<void> logout(BuildContext context) async {
    await SharedPrefHelper.clearAll();
    Navigator.of(context)
        .pushNamedAndRemoveUntil("/login", (route) => false);
    emit(ProfileInitial());
  }
}