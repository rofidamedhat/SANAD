import 'package:sanad/feature/profile/data/model/profile_response_body.dart';
import 'package:sanad/core/networking/api_service.dart';

class ProfileRepository {
  final ApiService apiService;

  ProfileRepository({required this.apiService});

  Future<ProfileResponseBody> getProfile() async {
    try {
      final response = await apiService.profile();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}