import 'package:json_annotation/json_annotation.dart';

part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final String message;
  final String token;
  final bool isAuthenticated;
  final String role;
  LoginResponseBody({
      required this.token,
      required this.isAuthenticated, required this.role,
    required this.message,

  });

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}


