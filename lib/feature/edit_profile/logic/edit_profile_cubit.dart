import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../core/helper/shared_pref_helper.dart';
import '../../edit_profile/data/model/edit_profile_request_body.dart';
import '../../edit_profile/data/repo/edit_profile_repo.dart';
import '../../edit_profile/data/model/edit_profile_response_body.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepo repo;
  EditProfileCubit(this.repo) : super(EditProfileInitial());

  String name = '';
  String email = '';
  String role = '';

  File? profileImage;       
  String? profileImageUrl;  

  Future<void> loadInitialData() async {
    name = await SharedPrefHelper.getString("name") ?? '';
    email = await SharedPrefHelper.getString("email") ?? '';
    role = await SharedPrefHelper.getString("role") ?? '';

    profileImageUrl = await SharedPrefHelper.getString("profileImageUrl"); 

    emit(EditProfileLoaded());
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String role,
    File? image,
  }) async {
    emit(EditProfileLoading());

    try {
      final requestBody = EditProfileRequestBody(
        FullName: name,
        Email: email,
        Role: role,
      );

      final EditProfileResponseBody response = await repo.editProfile(
        requestBody: requestBody,
        image: image, 
      );

      this.name = response.data.fullName;
      this.email = response.data.email;
      this.role = response.data.role;

      if (image != null) {
        profileImage = image; 
      }

      await SharedPrefHelper.setData("name", this.name);
      await SharedPrefHelper.setData("email", this.email);
      await SharedPrefHelper.setData("role", this.role);

      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileError(message: e.toString()));
    }
  }
}