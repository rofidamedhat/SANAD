import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/core/networking/api_result.dart';
import 'package:sanad/core/networking/api_service.dart';
import 'package:sanad/feature/learn_videos/data/model/learn_videos_model.dart';

class LearnVideosRepo {
  final ApiService apiService;

  LearnVideosRepo(this.apiService);

  Future<ApiResult<LearnVideosModel>> getVideos() async {
    try {
      final response = await apiService.getVideos();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
