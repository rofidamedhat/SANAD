import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/widgets/shimmer_grid_view_loading.dart';
import 'package:sanad/feature/share_question/logic/get_post_cubit.dart';
import 'package:sanad/feature/share_question/ui/widgets/floating_action_button_design.dart';
import 'package:sanad/feature/share_question/ui/widgets/share_questions_app_bar.dart';
import 'package:sanad/feature/share_question/ui/widgets/share_questions_card_item.dart';

import '../../../core/constants.dart';
import '../../../core/routing/routes.dart';

class ShareQuestionsScreen extends StatefulWidget {
  const ShareQuestionsScreen({super.key});

  @override
  State<ShareQuestionsScreen> createState() => _ShareQuestionsScreenState();
}

class _ShareQuestionsScreenState extends State<ShareQuestionsScreen> {
  void initState() {
    super.initState();
    context.read<GetPostCubit>().getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: ShareQuestionsAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 15.w),
          child: BlocConsumer<GetPostCubit, GetPostState>(
  listener: (context, state) {
    if(state is GetPostWithError){
      return setupErrorState(context, state.apiErrorModel.message!);
    }
  },
  builder: (context, state) {
      if(state is GetPostLoading){
        return ListView.separated(
          itemBuilder: (context, index) {
            return ShareQuestionsCardItem(index: index,);
          },
          separatorBuilder: (context, index) {
            return verticalSpace(20);
          },
          itemCount: 10,
        );
      }
      else if(state is GetPostSuccessfully){
        return ListView.separated(
          itemBuilder: (context, index) {
            return ShareQuestionsCardItem(index: index,);
          },
          separatorBuilder: (context, index) {
            return verticalSpace(20);
          },
          itemCount: context.read<GetPostCubit>().getPostResponseBody!.data.length,
        );
      }
      else{
        return SizedBox.shrink();
      }
  },
),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 10.w),
        child: SizedBox(
          height: 80.h,
          width: 80.w,
          child: FloatingActionButtonDesign(),
        ),
      ),
    );
  }
}
