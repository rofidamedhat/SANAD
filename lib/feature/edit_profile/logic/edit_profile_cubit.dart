import 'package:bloc/bloc.dart';
import '../../../core/helper/shared_pref_helper.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String role,
  }) async {
    emit(EditProfileLoading());

    try {
      await SharedPrefHelper.setString("name", name);
      await SharedPrefHelper.setString("email", email);
      await SharedPrefHelper.setString("phone", phone);
      await SharedPrefHelper.setString("role", role);

      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileError());
    }
  }
}