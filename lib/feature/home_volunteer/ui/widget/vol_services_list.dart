import 'package:flutter/material.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/core/widgets/service_card.dart';

class VolServicesList extends StatelessWidget {
  const VolServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        ServiceCard(
          title: 'المحادثة الجماعية',
          icon: Icons.chat_bubble_outline,
          iconColor: Colors.blue,
          onTap: () {},
        ),
        ServiceCard(
          title: 'تعلم لغة الإشارة',
          icon: Icons.sign_language,
          iconColor: Colors.orange,
          onTap: () => context.pushNamed(Routes.learnSignLangScreen),
        ),
        ServiceCard(
          title: 'المساعدة بالدعم',
          icon: Icons.people_outline,
          iconColor: Colors.green,
          onTap: () {},
        ),
      ],
    );
  }
}
