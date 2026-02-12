import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/helper/helper_function.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/widgets/shimmer_grid_view_loading.dart';
import 'package:sanad/core/widgets/sign_learning_card.dart';
import 'package:sanad/feature/learn_famous_words/logic/cubit/learn_words_cubit.dart';

class WordsGridView extends StatefulWidget {
  const WordsGridView({super.key});

  @override
  State<WordsGridView> createState() => _WordsGridViewState();
}

class _WordsGridViewState extends State<WordsGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var cubit = context.read<LearnWordsCubit>();
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        if (!cubit.isFetching && cubit.currentPage <= cubit.totalPages) {
          cubit.getWords(isInitial: false);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearnWordsCubit, LearnWordsState>(
      builder: (context, state) {
        var cubit = context.read<LearnWordsCubit>();
        var words = cubit.allWords;
        if (state is LearnWordsLoadingState && words.isEmpty) {
          return ShimmerGridViewLoading();
        }
        return GridView.builder(
          controller: _scrollController,
          itemCount:
              words.length + (cubit.currentPage <= cubit.totalPages ? 2 : 0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            if (index < words.length) {
              return SignLearningCard(
                label: words[index].word,
                imageUrl:
                    "https://sanadapllication2025api.premiumasp.net${words[index].imageUrl}",
                color: AppColors.beigeD2,
              );
            } else {
              return const ShimmerCardItem();
            }
          },
        );
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
       // if (state is LearnWordsSuccessState) {
        //   final Words = state.wordsList;
        //   return GridView.builder(
        //     itemCount: Words.length,
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       mainAxisSpacing: 16,
        //       crossAxisSpacing: 16,
        //       childAspectRatio: 0.75,
        //     ),
        //     itemBuilder: (context, index) {
        //       return SignLearningCard(
        //         label: Words[index].word,
        //         imageUrl:
        //             "https://sanadapllication2025api.premiumasp.net${Words[index].imageUrl}",
        //         color: AppColors.beigeD2,
        //       );
        //     },
        //   );
        // } else if (state is LearnWordsErrorState) {
        //   return Text('Error ${state.apiErrorModel.message}');
        // } else {
        //   return Center(
        //     child: CircularProgressIndicator(color: AppColors.green69),
        //   );
        // }