import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/feature/share_question/logic/get_post_logic/get_post_cubit.dart';
import 'package:sanad/feature/share_question/ui/widgets/share_questions_card_item_content.dart';
import 'package:sanad/feature/share_question/ui/widgets/shimmer_card_item_loading.dart';

class ShareQuestionsCardItem extends StatelessWidget {
  int index;
  ShareQuestionsCardItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.lighterGray,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.grayC1,
            blurRadius: 25,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: context.read<GetPostCubit>().isLoading == true
          ? ShimmerCardItemLoading()
          : GestureDetector(
            onTap: ()async{
              final bool? isDeleted = await context.pushNamed(
                  Routes.postDetailsScreen,
              arguments: context
                  .read<GetPostCubit>()
                  .getPostResponseBody!
                  .data[index],
              );
              if (isDeleted == true && context.mounted) {
                // 3. بننادي الدالة اللي بتجيب الداتا من الباكيند في الكوبيت بتاع الشاشة الرئيسية
                context.read<GetPostCubit>().emit(GetPostLoading());
                context.read<GetPostCubit>().getPost();
              }
            },
            child: ShareQuestionsCardItemContent(
                addPostResponseData: context
                    .read<GetPostCubit>()
                    .getPostResponseBody!
                    .data[index],
              ),
          ),
    );
  }
}
