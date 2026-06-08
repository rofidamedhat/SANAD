class DeleteMedicineRequestBody {
  final int id;
  final List<String> days;

  DeleteMedicineRequestBody({
    required this.id,
    required this.days,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'days': days.map((day) => day.trim()).toList(),
      };
}