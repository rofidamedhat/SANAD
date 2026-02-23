import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../feature/profile/data/model/profile_response_body.dart';
import '../../../feature/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit({required this.repository}) : super(ProfileInitial());

  String name = '';
  String email = '';
  String role = '';
  String profileImageUrl = '';

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
      debugPrint("Profile Error: ${e.toString()}");
      emit(ProfileError(message: e.toString()));
    }
  }

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

  Future<void> logout(BuildContext context) async {

    name = '';
    email = '';
    role = '';
    profileImageUrl = '';
    

    if (context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
    }
    
    emit(ProfileInitial());
  }
}