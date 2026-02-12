import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/di/dependency_injection.dart';
import 'package:sanad/core/widgets/custom_app_bar.dart';
import 'package:sanad/core/widgets/gradiant_background.dart';
import 'package:sanad/feature/learn_numbers/logic/cubit/learn_number_cubit.dart';
import 'package:sanad/feature/learn_numbers/ui/widgets/numbers_grid_view.dart';

class LearnNumberScreen extends StatelessWidget {
  const LearnNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LearnNumberCubit(getIt())..getNumbers(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'الأرقام'),
        body: SafeArea(
          child: GradientBackground(
            colors: [Color(0xFFF2F9FA), Color(0xFFE0F0F3)],
            child: NumbersGridView(),
          ),
        ),
      ),
    );
  }
}
