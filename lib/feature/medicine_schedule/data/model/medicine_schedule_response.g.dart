// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineScheduleResponse _$MedicineScheduleResponseFromJson(
  Map<String, dynamic> json,
) => MedicineScheduleResponse(
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => MedicineScheduleData.fromJson(e as Map<String, dynamic>))
      .toList(),
  isSuccess: json['isSuccess'] as bool?,
);

Map<String, dynamic> _$MedicineScheduleResponseToJson(
  MedicineScheduleResponse instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
  'isSuccess': instance.isSuccess,
};

MedicineScheduleData _$MedicineScheduleDataFromJson(
  Map<String, dynamic> json,
) => MedicineScheduleData(
  id: (json['id'] as num?)?.toInt(),
  medicineName: json['medicineName'] as String?,
  time: json['time'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$MedicineScheduleDataToJson(
  MedicineScheduleData instance,
) => <String, dynamic>{
  'id': instance.id,
  'medicineName': instance.medicineName,
  'time': instance.time,
  'notes': instance.notes,
};
