import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/networking/api_result.dart'; 
import '../data/repo/add_medicine_repo.dart';
import '../data/model/add_medicine_request_body.dart';
import '../data/model/add_medicine_response_body.dart';
import 'add_medicine_state.dart';
import 'package:sanad/core/services/notification_service.dart';
import 'package:timezone/timezone.dart' as tz; 

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
        
        try {
          final timeParts = timeController.text.split(':');
          final hour = int.parse(timeParts[0]);
          final minute = int.parse(timeParts[1]);

          Map<String, int> daysMap = {
            "السبت": DateTime.saturday,
            "الأحد": DateTime.sunday,
            "الإثنين": DateTime.monday,
            "الثلاثاء": DateTime.tuesday,
            "الأربعاء": DateTime.wednesday,
            "الخميس": DateTime.thursday,
            "الجمعة": DateTime.friday,
          };

          for (String day in selectedDays) {
            int? dayOfWeek = daysMap[day];
            if (dayOfWeek != null) {
              tz.TZDateTime scheduledDate = _nextInstanceOfDayAndTime(dayOfWeek, hour, minute);
              
              int uniqueId = ((response.data.data?.id ?? 0) * 10) + dayOfWeek;

              await NotificationService.scheduleNotification(
                id: uniqueId,
                title: "موعد الدواء 💊",
                body: "لا تنسَ أخذ دواء ${nameController.text}",
                scheduledDate: scheduledDate,
              );
            }
          }
        } catch (e) {
          print("Notification Error: $e");
        }
        // ----------------------------------------

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

  tz.TZDateTime _nextInstanceOfDayAndTime(int day, int hour, int minute) {
    tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    while (scheduledDate.weekday != day || scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  @override
  Future<void> close() {
    nameController.dispose();
    timeController.dispose();
    notesController.dispose();
    return super.close();
  }
}