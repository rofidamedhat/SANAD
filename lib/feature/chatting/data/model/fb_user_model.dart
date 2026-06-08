//يبقي ده اللي هجمعله الداتا من الابليكشن واويها للفايربيز

class FbUserModel {
  final String uId;
  final String name;
  final String email;
  final String image;
  final String role;

  FbUserModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.image,
    required this.role,
  });

  factory FbUserModel.fromJson(Map<String, dynamic> json) {
    return FbUserModel(
      uId: json['uId'] ?? '',
      name: json['name'] ?? 'مستخدم غير معروف',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      role: json['role'] ?? 'user',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'image': image,
      'role': role,
    };
  }
}
