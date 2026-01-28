import 'package:flutter/material.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/core/widgets/service_card.dart';

class DeafServicesList extends StatelessWidget {
  const DeafServicesList({super.key});

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
          title: 'زر الاستغاثه ',
          icon: Icons.sos_sharp,
          imagePath: 'assets/svgs/sos.svg',
          iconColor: Colors.red,
          onTap: () {},
        ),
        ServiceCard(
          title: 'المساعدة بالدعم',
          icon: Icons.people_outline,
          iconColor: Colors.green,
          onTap: () {},
        ),
        ServiceCard(
          title: 'تحويل النص \n والفيديو',
          icon: Icons.video_file_outlined,
          iconColor: Colors.blue,
          onTap: () {},
          // imagePath: 'assets/svgs/text_to_vid.svg',
        ),
        ServiceCard(
          title: 'تحويل النص \nوالصوت ',
          icon: Icons.audio_file_outlined,
          iconColor: Colors.orange,
          onTap: () {},
        ),

        ServiceCard(
          title: 'جدول مواعيد \n العلاج ',
          icon: Icons.medical_information,
          iconColor: Colors.blue,
          onTap: () {},
          // imagePath: "assets/svgs/mid_cal.svg",
        ),
      ],
    );
  }
}
