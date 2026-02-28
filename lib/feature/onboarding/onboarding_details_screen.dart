import 'package:flutter/material.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/helper/strings.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/onboarding/widgets/custom_indicator.dart';
import 'package:sanad/feature/onboarding/widgets/onboarding_custom_screen.dart';

import '../../core/routing/routes.dart';

class OnboardingDetailsScreen extends StatefulWidget {
  const OnboardingDetailsScreen({super.key});

  @override
  State<OnboardingDetailsScreen> createState() =>
      _OnboardingDetailsScreenState();
}

class _OnboardingDetailsScreenState extends State<OnboardingDetailsScreen> {
  final PageController controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  index = value;
                  setState(() {

                  });
                },
                controller: controller,
                children: [
                  OnboardingCustomScreen(
                    image: onboardingDetailsImage1,
                    title: "سند",
                    description:
                        "سند هو الجسر الذي يوصل بين الصمو بين العالم من حولهم. من خلاله، تتحول لغة الإشارة لحياة، وتشعر ان كل شخص له صوت،وله مكان، وله فرصة يعبّر عن نفسه بثقة.",
                  ),
                  OnboardingCustomScreen(
                    title: "الأمان أولاً ",
                    image: onboardingDetailsImage2,
                    description:
                        "زر الطوارئ لإنقاذك وقت الحاجة.بإرسال رسالةسريعة أو مشاركة موقعك الحالي فوراً لأن سلامتك اهم شيء",
                  ),
                  OnboardingCustomScreen(
                    title: "المتطوعين هم الصوت والدعمً ",
                    image: onboardingDetailsImage3,
                    description:
                        "كل متطوع ليس فقط يمكنه ان يتعلم لغة الإشارة،لكن يبني علاقة إنسانية حقيقية، ويكون من اقربالأشخاص الذين يمكن الإعتماد عليهم في أي موقف طارئ. حضورهم يحوّل الدعم لأمان وثقة",
                  ),
                  OnboardingCustomScreen(
                    title: "تواصل بدون حدود",
                    image: onboardingDetailsImage4,
                    description:
                        "ترجمة الكلام الي صوت والعكس ، وترجمة الإشارة فوراً بالفيديو الي كلام ،الذكاء الاصطناعي  سيساعدك في فهم غيرك ويجعل غيرك يفهمكبسهولة بلغة القلوب والإشارات",
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIndicator(active: index == 0),
                horizontalSpace(5),
                CustomIndicator(active: index == 1),
                horizontalSpace(5),
                CustomIndicator(active: index == 2),
                horizontalSpace(5),
                CustomIndicator(active: index == 3),
              ],
            ),
            Padding(padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (index == 3) {
                      context.pushReplacementNamed(Routes.loginScreen);
                    } else {
                      controller.animateToPage(
                        index +1,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.linear,
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.green69,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      index == 3 ? "تسجيل الدخول" : "التالى",
                      style: TextStyles.font20WhiteSemiBold
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                      context.pushReplacementNamed(Routes.signUpScreen);

                  },
                  child: Text(
                      index == 3 ? "انشاء حساب" : "تخطى",
                      style:TextStyles.font18Black05Bold
                  ),
                ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
