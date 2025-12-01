
import 'package:json_annotation/json_annotation.dart';
part 'signup_response_body.g.dart';
@JsonSerializable()
class SignupResponseBody{
  final String message;
  final String? token;
  final bool isAuthenticated;
  final String? role;
  SignupResponseBody({
    required this.token,
    required this.isAuthenticated, required this.role,
    required this.message,

  });

  factory SignupResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseBodyToJson(this);
}