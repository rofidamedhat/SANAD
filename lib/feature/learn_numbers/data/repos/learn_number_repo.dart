import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/core/networking/api_result.dart';
import 'package:sanad/core/networking/api_service.dart';
import 'package:sanad/feature/learn_numbers/data/models/learn_numbers_model.dart';

class LearnNumberRepo {
  final ApiService apiService;

  LearnNumberRepo(this.apiService);

  Future<ApiResult<LearnNumbersModel>> getNumbers(int pageNumber,int pageSize) async {
    try {
      final response = await apiService.getNumbers(pageNumber, pageSize);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
