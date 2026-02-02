import 'package:flutter/material.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/feature/learn_sign_lang/ui/widget/catergory_card.dart';

class LearningList extends StatelessWidget {
  const LearningList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CategoryListTile(
          title: 'الحروف الأبجدية',
          subtitle: 'ابني من الأساسيات',
          imagePath: 'assets/images/alphabet.png',
          backgroundColor: AppColors.greenC2,
          onTap: () => context.pushNamed(Routes.learnAlphabetScreen),
        ),
        CategoryListTile(
          title: 'الأرقام',
          subtitle: 'تعلم العد بالإشارة',
          imagePath: 'assets/images/numbers.png',
          backgroundColor: AppColors.blueE0,
          onTap: () => context.pushNamed(Routes.learnNumberScreen),
        ),
        CategoryListTile(
          title: 'أشهر الكلمات',
          subtitle: 'كلمات يومية',
          imagePath: 'assets/images/words.png',
          backgroundColor: AppColors.beigeD2,
          onTap: () => context.pushNamed(Routes.learnFamousWordsScreen),
        ),
        CategoryListTile(
          title: 'فيديوهات شرح',
          subtitle: 'تعلم بالمشاهدة',
          imagePath: 'assets/images/videos.png',
          backgroundColor: AppColors.orangeA6,
          onTap: () {},
        ),
      ],
    );
  }
}
