import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/networking/api_result.dart'; 
import '../data/repo/add_medicine_repo.dart';
import '../data/model/add_medicine_request_body.dart';
import '../data/model/add_medicine_response_body.dart';
import 'add_medicine_state.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  final AddMedicineRepo _addMedicineRepo;
  AddMedicineCubit(this._addMedicineRepo) : super(AddMedicineInitial());

  final nameController = TextEditingController();
  final timeController = TextEditingController();
  final notesController = TextEditingController();
  
  List<String> selectedDays = [];

  void emitAddMedicineStates() async {
    if (nameController.text.isEmpty || selectedDays.isEmpty || timeController.text.isEmpty) {
       emit(AddMedicineError(error: "يرجى إكمال جميع البيانات واختيار الوقت والأيام"));
       return;
    }
    print("الأيام اللي مبعوتة من الكيوبيت: ${selectedDays}");
    emit(AddMedicineLoading());

    try {
      final response = await _addMedicineRepo.addMedicine(
        AddMedicineRequestBody(
          medicineName: nameController.text,
          time: timeController.text,
          notes: notesController.text,
          medicineDays: selectedDays,
        ),
      );

if (response is Success<AddMedicineResponse>) {
    emit(AddMedicineSuccess(response.data));
} else if (response is Failure<AddMedicineResponse>) {
    emit(AddMedicineError(error: response.apiErrorModel.message ?? "خطأ"));
} else {
    emit(AddMedicineError(error: "حدث خطأ غير متوقع"));
}
    } catch (e) {
      print("Cubit Catch: $e");
      emit(AddMedicineError(error: "مشكلة في الاتصال بالسيرفر، تأكد من تسجيل الدخول"));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    timeController.dispose();
    notesController.dispose();
    return super.close();
  }
}