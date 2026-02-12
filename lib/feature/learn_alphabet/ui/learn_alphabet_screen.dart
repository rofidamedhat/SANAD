import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/di/dependency_injection.dart';
import 'package:sanad/core/widgets/custom_app_bar.dart';
import 'package:sanad/core/widgets/gradiant_background.dart';
import 'package:sanad/feature/learn_alphabet/logic/cubit/learn_alphabet_cubit.dart';
import 'package:sanad/feature/learn_alphabet/ui/widgets/letters_grid_view.dart';

class LearnAlphabetScreen extends StatelessWidget {
  const LearnAlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LearnAlphabetCubit(getIt())..getLetters(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'الحروف الأبجدية'),
        body: SafeArea(
          child: GradientBackground(
            colors: [Color(0xFFF7FAF9), Color(0xFFEFF5F3)],
            child: LettersGridView(),
          ),
        ),
      ),
    );
  }
}
