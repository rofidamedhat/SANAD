import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/helper/helper_function.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/widgets/shimmer_grid_view_loading.dart';
import 'package:sanad/core/widgets/sign_learning_card.dart';
import 'package:sanad/feature/learn_numbers/data/models/learn_numbers_model.dart';
import 'package:sanad/feature/learn_numbers/logic/cubit/learn_number_cubit.dart';

class NumbersGridView extends StatefulWidget {
  const NumbersGridView({super.key});

  @override
  State<NumbersGridView> createState() => _NumbersGridViewState();
}

class _NumbersGridViewState extends State<NumbersGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var cubit = context.read<LearnNumberCubit>();
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        if (!cubit.isFetching && cubit.currentPage <= cubit.totalPages) {
          cubit.getNumbers(isInitial: false);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearnNumberCubit, LearnNumberState>(
      builder: (context, state) {
        var cubit = context.read<LearnNumberCubit>();
        var numbers = cubit.allNumbers;

        if (state is LearnNumberLoadingState && numbers.isEmpty) {
          return ShimmerGridViewLoading();
        }

        return setUpSuccess(numbers, cubit);
      },
    );
  }

  Widget setUpSuccess(List<NumberItem> numbers, LearnNumberCubit cubit) {
    return GridView.builder(
      controller: _scrollController,
      itemCount:
          numbers.length + (cubit.currentPage <= cubit.totalPages ? 2 : 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        if (index < numbers.length) {
          return SignLearningCard(
            label: numbers[index].value.toString(),
            imageUrl:
                "https://sanadapllication2025api.premiumasp.net${numbers[index].imageUrl}",
            color: AppColors.blueE0,
          );
        } else {
          return const ShimmerCardItem();
        }
      },
    );
  }

  @override
  void dispose() {
    handleDisposeScrollController(
      controller: _scrollController,
      function: () {},
    );
    super.dispose();
  }
}
