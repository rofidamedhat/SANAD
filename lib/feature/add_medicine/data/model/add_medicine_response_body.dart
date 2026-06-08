class AddMedicineResponse {
  int? statusCode;
  String? message;
  bool? isSuccess;
  MedicineData? data;

  AddMedicineResponse({this.statusCode, this.message, this.isSuccess, this.data});

  AddMedicineResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    isSuccess = json['isSuccess'];
    data = json['data'] != null ? MedicineData.fromJson(json['data']) : null;
  }
}

class MedicineData {
  int? id;
  String? medicineName;
  String? time;
  String? notes;

  MedicineData({this.id, this.medicineName, this.time, this.notes});

  MedicineData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicineName = json['medicineName'];
    time = json['time'];
    notes = json['notes'];
  }
}