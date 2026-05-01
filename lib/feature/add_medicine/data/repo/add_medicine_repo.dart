import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/core/networking/api_result.dart';
import 'package:sanad/core/networking/api_service.dart';
import '../model/add_medicine_request_body.dart';
import '../model/add_medicine_response_body.dart';

class AddMedicineRepo {
  final ApiService _apiService;

  AddMedicineRepo(this._apiService);

  Future<ApiResult<AddMedicineResponse>> addMedicine(
      AddMedicineRequestBody addMedicineRequestBody) async {
    try {
      final response = await _apiService.addMedicine(addMedicineRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}