import 'package:flutter/material.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class LearnSignLangScreen extends StatelessWidget {
  const LearnSignLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        iconTheme: const IconThemeData(color: AppColors.green69),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('تعلم لغة الإشارة', style: TextStyles.font26green69Bold),
            verticalSpace(10),
            Text(
              'خطوه بخطوه للتواصل بدون حواجز ',
              style: TextStyles.font22greySemiBold,
            ),
            Icon(
              Icons.favorite,
              color: const Color.fromARGB(255, 134, 187, 183),
            ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(20),
            //     child: GridView.count(
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 16,
            //       mainAxisSpacing: 16,
            //       children: [
            //         CategoryCard(
            //           title: 'الحروف الأبجدية',
            //           subtitle: 'ابني من الأساسيات',
            //           imagePath: 'assets/images/alphabet.png',
            //           backgroundColor: AppColors.greenC2,
            //           onTap: () {},
            //         ),
            //         CategoryCard(
            //           title: 'الأرقام',
            //           subtitle: 'تعلم العد بالإشارة',
            //           imagePath: 'assets/images/numbers.png',
            //           backgroundColor: AppColors.blueE0,
            //           onTap: () {},
            //         ),
            //         CategoryCard(
            //           title: 'أشهر الكلمات',
            //           subtitle: 'كلمات يومية',
            //           imagePath: 'assets/images/words.png',
            //           backgroundColor: AppColors.beigeD2,
            //           onTap: () {},
            //         ),
            //         CategoryCard(
            //           title: 'فيديوهات شرح',
            //           subtitle: 'تعلم بالمشاهدة',
            //           imagePath: 'assets/images/videos.png',
            //           backgroundColor: AppColors.orangeA6,
            //           onTap: () {},
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
