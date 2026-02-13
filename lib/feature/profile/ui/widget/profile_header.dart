import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'profile_header_clipper.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String? imageUrl;

  const ProfileHeader({
    super.key,
    required this.name,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // الخلفية المنحنية
        ClipPath(
          clipper: ProfileHeaderClipper(),
          child: Container(
            width: double.infinity,
            height: 220, // زودنا الارتفاع شوية عشان القوس يبان انسيابي أكتر
            color: AppColors.green69,
          ),
        ),

        Column(
          children: [
            const SizedBox(height: 120), // زحزحنا الصورة لتحت شوية عشان تيجي في نص القوس

            // صورة البروفايل
     CircleAvatar(
  radius: 75,
  backgroundColor: AppColors.greenC2,
  // بنحط الشرط ده عشان نضمن إن الـ URL حقيقي وموجود
  backgroundImage: (imageUrl != null && 
                    imageUrl!.isNotEmpty && 
                    imageUrl != "null" && 
                    imageUrl != "default") // ضيفي أي كلمة تانية الباك بيبعتها كـ default
      ? NetworkImage("https://sanadapllication2025api.premiumasp.net$imageUrl")
      : null, 
  child: (imageUrl == null || imageUrl!.isEmpty || imageUrl == "null" || imageUrl == "default")
      ? const Icon(
          Icons.person,
          size: 70,
          color: AppColors.green69,
        )
      : null,
),
            const SizedBox(height: 15),

            // الاسم
            Text(
              name.isEmpty ? "اسم المستخدم" : name,
              style: const TextStyle(
                fontSize: 20, // كبرنا الخط سنة بسيطة للتوضيح
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}