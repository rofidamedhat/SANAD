import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/networking/api_result.dart'; 
import '../data/repo/schedule_repo.dart';
import '../data/model/medicine_schedule_response.dart';
import 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final ScheduleRepo _scheduleRepo;
  
  String currentSelectedDay = "السبت";

  ScheduleCubit(this._scheduleRepo) : super(const ScheduleInitial());

  void getSchedule(String day) async {
    currentSelectedDay = day;

    emit(const ScheduleLoading());

    print("🚀 الـ Cubit بيبعت ريكويست GET لليوم ده: '$day'");

    final response = await _scheduleRepo.getSchedule(day);

    if (response is Success<MedicineScheduleResponse>) {
      final medicines = (response as Success<MedicineScheduleResponse>).data.data ?? [];
      
      print("✅ Success: Found ${medicines.length} medicines"); 
      
      emit(ScheduleSuccess(List.from(medicines)));
    } else if (response is Failure<MedicineScheduleResponse>) {
      final errorModel = (response as Failure<MedicineScheduleResponse>).apiErrorModel;
      emit(ScheduleError(error: errorModel.message ?? "حدث خطأ ما"));
    }
  }
}