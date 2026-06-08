import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart'; 
part 'medicine_schedule_response.g.dart';

@JsonSerializable()
class MedicineScheduleResponse {
  final int? statusCode;
  final String? message;
  final List<MedicineScheduleData>? data;
  final bool? isSuccess;

  MedicineScheduleResponse({this.statusCode, this.message, this.data, this.isSuccess});

  factory MedicineScheduleResponse.fromJson(Map<String, dynamic> json) => _$MedicineScheduleResponseFromJson(json);
}

@JsonSerializable()
class MedicineScheduleData {
  final int? id;
  final String? medicineName;
  final String? time;
  final String? notes;

  MedicineScheduleData({this.id, this.medicineName, this.time, this.notes});

  factory MedicineScheduleData.fromJson(Map<String, dynamic> json) => _$MedicineScheduleDataFromJson(json);
}