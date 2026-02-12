import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/di/dependency_injection.dart';
import 'package:sanad/core/widgets/custom_app_bar.dart';
import 'package:sanad/core/widgets/gradiant_background.dart';
import 'package:sanad/feature/learn_famous_words/logic/cubit/learn_words_cubit.dart';
import 'package:sanad/feature/learn_famous_words/ui/widgets/words_grid_view.dart';

//0xFFFDFCF7 ,0xFFF7F2E6
class LearnFamousWordsScreen extends StatelessWidget {
  const LearnFamousWordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LearnWordsCubit(getIt())..getWords(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'أشهر الكلمات'),
        body: SafeArea(
          child: SafeArea(
            child: GradientBackground(
              colors: [Color(0xFFFDFCF7), Color(0xFFF7F2E6)],
              child: WordsGridView(),
            ),
          ),
        ),
      ),
    );
  }
}
