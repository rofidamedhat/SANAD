class DeleteMedicineResponse {
  final int? statusCode;
  final String? message;
  final bool? isSuccess;
  final dynamic data; 

  DeleteMedicineResponse({
    this.statusCode,
    this.message,
    this.isSuccess,
    this.data,
  });

  factory DeleteMedicineResponse.fromJson(Map<String, dynamic> json) {
    return DeleteMedicineResponse(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      isSuccess: json['isSuccess'] as bool?,
      data: json['data'],
    );
  }
}