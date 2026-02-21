import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/widgets/shimmer_grid_view_loading.dart';
import 'package:sanad/core/widgets/sign_learning_card.dart';
import 'package:sanad/feature/learn_alphabet/logic/cubit/learn_alphabet_cubit.dart';

class LettersGridView extends StatefulWidget {
  const LettersGridView({super.key});

  @override
  State<LettersGridView> createState() => _LettersGridViewState();
}

class _LettersGridViewState extends State<LettersGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    var cubit = context.read<LearnAlphabetCubit>();
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!cubit.isFetching && cubit.currentPage <= cubit.totalPages) {
        cubit.getLetters(isInitial: false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LearnAlphabetCubit, LearnAlphabetState>(
      listenWhen: (previous, current) => current is LearnAlphabetErrorState,
      listener: (context, state) {
        if (context.read<LearnAlphabetCubit>().allLetters.isNotEmpty) {
          showErrorSnackBar(context);
        }
      },
      child: BlocBuilder<LearnAlphabetCubit, LearnAlphabetState>(
        builder: (context, state) {
          var cubit = context.read<LearnAlphabetCubit>();
          var letters = cubit.allLetters;

          if (state is LearnAlphabetErrorState && letters.isEmpty) {
            return setUpError("حدث خطأ، تأكد من الانترنت");
          }

          if (state is LearnAlphabetLoadingState && letters.isEmpty) {
            return ShimmerGridViewLoading();
          }

          return setUpSuccess(letters, cubit.isFetching);
        },
      ),
    );
  }

  Widget setUpSuccess(List letters, bool isFetching) {
    return GridView.builder(
      controller: _scrollController,
      itemCount: letters.length + (isFetching ? 2 : 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        if (index < letters.length) {
          return SignLearningCard(
            label: letters[index].letter,
            imageUrl:
                "https://sanadapllication2025api.premiumasp.net${letters[index].imageUrl}",
            color: AppColors.green69,
          );
        } else {
          return const ShimmerCardItem();
        }
      },
    );
  }

  Widget setUpError(String error) {
    return Center(child: Text(error));
  }

  void showErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("مشكلة في تحميل المزيد من الحروف")),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
