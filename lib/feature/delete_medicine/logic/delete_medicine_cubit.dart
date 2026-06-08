import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/networking/api_result.dart';
import 'package:sanad/feature/delete_medicine/data/model/delete_medicine_request.dart';
import 'package:sanad/feature/delete_medicine/data/model/delete_medicine_response.dart';
import 'package:sanad/feature/delete_medicine/data/repo/delete_medicine_repo.dart';
import 'delete_medicine_state.dart';

class DeleteMedicineCubit extends Cubit<DeleteMedicineState> {
  final DeleteMedicineRepo _deleteMedicineRepo;

  DeleteMedicineCubit(this._deleteMedicineRepo) : super(DeleteMedicineInitialState());

  void emitDeleteMedicineStates({
    required int medicineId,
    required List<String> daysToDelete,
  }) async {
    if (daysToDelete.isEmpty) {
      emit(DeleteMedicineErrorState(errorMessage: "يرجى اختيار يوم واحد على الأقل للمسح"));
      return;
    }

    emit(DeleteMedicineLoadingState());

    try {
      final response = await _deleteMedicineRepo.deleteMedicine(
        DeleteMedicineRequestBody(
          id: medicineId,
          days: daysToDelete,
        ),
      );

      if (response is Success<DeleteMedicineResponse>) {
        final successData = response.data; 
        emit(DeleteMedicineSuccessState(
          message: successData.message ?? "تم الحذف بنجاح",
        ));
      } else if (response is Failure<DeleteMedicineResponse>) {
        final failureData = response as Failure<DeleteMedicineResponse>;
        emit(DeleteMedicineErrorState(
          errorMessage: failureData.apiErrorModel.message ?? "حدث خطأ أثناء الحذف",
        ));
      } else {
        emit(DeleteMedicineErrorState(errorMessage: "حدث خطأ غير متوقع"));
      }
    } catch (e) {
      print("Delete Cubit Catch: $e");
      emit(DeleteMedicineErrorState(errorMessage: "مشكلة في الاتصال بالسيرفر، حاول مجدداً"));
    }
  }
}