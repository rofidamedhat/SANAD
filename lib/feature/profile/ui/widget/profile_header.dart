import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';

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
    final String fullImageUrl = "https://sanadapllication2025api.premiumasp.net${imageUrl ?? ''}";

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: 190,
          decoration: const BoxDecoration(
            color: AppColors.green69,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(55), 
              bottomRight: Radius.circular(55),
            ),
          ),
        ),

        Column(
          children: [
            const SizedBox(height: 90), 

            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 75,
                backgroundColor: AppColors.greenC2,
                child: ClipOval(
                  child: (imageUrl != null && 
                          imageUrl!.isNotEmpty && 
                          imageUrl != "null" && 
                          imageUrl != "default")
                      ? Image.network(
                          fullImageUrl,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                          // لو السيرفر رجع 404 أو الصورة باظت، هيعرض الأيكون ده:
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person,
                              size: 70,
                              color: AppColors.green69,
                            );
                          },
                        )
                      : const Icon(
                          Icons.person,
                          size: 70,
                          color: AppColors.green69,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            Text(
              name.isEmpty ? "اسم المستخدم" : name,
              style: const TextStyle(
                fontSize: 20,      
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