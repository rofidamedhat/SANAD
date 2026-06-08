import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/core/networking/api_result.dart';
import 'package:sanad/core/networking/api_service.dart'; // حطي المسار الصح للـ ApiService الجديد لو فصلتيه
import 'package:sanad/feature/delete_medicine/data/model/delete_medicine_request.dart';
import 'package:sanad/feature/delete_medicine/data/model/delete_medicine_response.dart';

class DeleteMedicineRepo {
  final ApiService _apiService; 

  DeleteMedicineRepo(this._apiService);

  Future<ApiResult<DeleteMedicineResponse>> deleteMedicine(
      DeleteMedicineRequestBody deleteMedicineRequestBody) async {
    try {
      final response = await _apiService.deleteMedicine(body: deleteMedicineRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}