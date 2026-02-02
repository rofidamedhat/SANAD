import 'package:flutter/material.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/widgets/sign_learning_card.dart';

class LearnFamousWordsScreen extends StatelessWidget {
  const LearnFamousWordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'أشهر الكلمات',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back, color: AppColors.greenA4, size: 30),
        ),
        iconTheme: const IconThemeData(color: AppColors.green69),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: 28,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return SignLearningCard(
                label: 'توقف',
                imageUrl: null,
                color: AppColors.beigeD2,
              );
            },
          ),
        ),
      ),
    );
  }
}
