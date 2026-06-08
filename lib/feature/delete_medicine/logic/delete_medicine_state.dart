abstract class DeleteMedicineState {}

class DeleteMedicineInitialState extends DeleteMedicineState {}
class DeleteMedicineLoadingState extends DeleteMedicineState {}

class DeleteMedicineSuccessState extends DeleteMedicineState {
  final String message;
  DeleteMedicineSuccessState({required this.message}); // التأكيد على القوسين دول 🎯
}

class DeleteMedicineErrorState extends DeleteMedicineState {
  final String errorMessage;
  DeleteMedicineErrorState({required this.errorMessage}); // والقوسين دول 🎯
}