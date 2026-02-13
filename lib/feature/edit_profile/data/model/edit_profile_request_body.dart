import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_body.g.dart';

@JsonSerializable()
class EditProfileRequestBody {
  final String FullName;
  final String Email;
  final String Role;

  @JsonKey(ignore: true)
  final File? ProfileImage; 

  EditProfileRequestBody({
    required this.FullName,
    required this.Email,
    required this.Role,
    this.ProfileImage,
  });

  Map<String, dynamic> toJson() => _$EditProfileRequestBodyToJson(this);
}