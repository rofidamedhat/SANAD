import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/core/networking/api_result.dart';
import 'package:sanad/core/networking/api_service.dart';
import 'package:sanad/feature/learn_famous_words/data/models/learn_words_model.dart';

class LearnWordsRepo {
  final ApiService apiService;

  LearnWordsRepo(this.apiService);

  Future<ApiResult<LearnWordsModel>> getWords(int pageNumber,int pageSize) async {
    try {
      final response = await apiService.getWords(pageNumber, pageSize);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
