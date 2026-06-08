class AddMedicineRequestBody {
  final String medicineName; 
  final String time;
  final String notes;
  final List<String> medicineDays; 

  AddMedicineRequestBody({
    required this.medicineName,
    required this.time,
    required this.notes,
    required this.medicineDays,
  });

  Map<String, dynamic> toJson() => {
        'medicineName': medicineName,
        'time': time,
        'notes': notes,
        'medicineDays': medicineDays,
      };
}