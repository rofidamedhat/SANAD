
import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/core/networking/api_result.dart';
import 'package:sanad/core/networking/api_service.dart';
import 'package:sanad/feature/medicine_schedule/data/model/medicine_schedule_response.dart';

class ScheduleRepo {
  final ApiService _apiService;

  ScheduleRepo(this._apiService);

Future<ApiResult<MedicineScheduleResponse>> getSchedule(String day) async { 
  try {
    final response = await _apiService.getMedicineSchedule(day);
    return ApiResult.success(response);
  } catch (error) {
    return ApiResult.failure(ApiErrorHandler.handle(error));
  }
}
}