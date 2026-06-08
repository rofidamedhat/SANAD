import '../data/model/medicine_schedule_response.dart';

abstract class ScheduleState {
  const ScheduleState();
}

class ScheduleInitial extends ScheduleState {
  const ScheduleInitial();
}

class ScheduleLoading extends ScheduleState {
  const ScheduleLoading();
}

class ScheduleSuccess extends ScheduleState {
  final List<MedicineScheduleData> medicines;
  const ScheduleSuccess(this.medicines);
}

class ScheduleError extends ScheduleState {
  final String error;
  const ScheduleError({required this.error});
}