import '../data/model/add_medicine_response_body.dart';

abstract class AddMedicineState {}

class AddMedicineInitial extends AddMedicineState {}

class AddMedicineLoading extends AddMedicineState {}

class AddMedicineSuccess extends AddMedicineState {
  final AddMedicineResponse addMedicineResponse;
  AddMedicineSuccess(this.addMedicineResponse);
}

class AddMedicineError extends AddMedicineState {
  final String error;
  AddMedicineError({required this.error});
}