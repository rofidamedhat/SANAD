import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/core/networking/api_result.dart';
import 'package:sanad/core/networking/api_service.dart';
import 'package:sanad/feature/learn_alphabet/data/models/learn_alphabet_model.dart';

class LearnAlphabetRepo {
  final ApiService apiService;

  LearnAlphabetRepo(this.apiService);

  Future<ApiResult<LearnAlphabetModel>> getAlphabet(int pageNumber,int pageSize) async {
    try {
      final response = await apiService.getLetters(pageNumber, pageSize);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
