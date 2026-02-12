// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';
// -----------------------------------------------------------------------------
// الملف ده بيعرف شكل الخطأ اللي بيجيلنا من السيرفر.
//
// باختصار:
// - أي Error جاي من السيرفر بيتحول لكائن ApiErrorModel.
// - الكائن فيه كود رقمي (code) ورسالة (message) بتشرح الخطأ.
// - بنستخدم JsonSerializable عشان نحول بين JSON اللي جاي من السيرفر والكائن بسهولة.
//
// ليه ده مهم؟
// - أي مكان محتاج يقرأ Error من API ياخده من هنا بنفس الشكل.
// - يبسط التعامل مع الأخطاء في كل المشروع.
//
// ------------------------
@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? statusCode;

  ApiErrorModel({
    this.message,
    this.statusCode,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
