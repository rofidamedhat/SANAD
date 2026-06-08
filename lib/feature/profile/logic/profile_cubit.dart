// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sanad/core/helper/shared_pref_helper.dart';
import 'package:sanad/feature/chatting/data/service/fb_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../feature/profile/data/model/profile_response_body.dart';
import '../../../feature/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;
  final FireBaseService fireBaseService;

  ProfileCubit(this.repository, this.fireBaseService) : super(ProfileInitial());

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
      //
      String? uId = await SharedPrefHelper.getString("uId");
      if (uId != null) {
        await fireBaseService.fbSyncUserDataFromProfile(
          uId: uId,
          name: name,
          email: email,
          role: role,
          image: profileImageUrl,
        );
      }
      //
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
    print("Logout clicked");
    name = '';
    email = '';
    role = '';
    profileImageUrl = '';

    if (context.mounted) {
    // await SharedPrefHelper.removeData("role");
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil("/loginScreen", (route) => false);
    }

    emit(ProfileInitial());
  }
}
