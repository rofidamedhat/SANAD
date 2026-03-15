import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/widgets/shimmer_grid_view_loading.dart';
import 'package:sanad/feature/share_question/ui/widgets/floating_action_button_design.dart';
import 'package:sanad/feature/share_question/ui/widgets/share_questions_app_bar.dart';
import 'package:sanad/feature/share_question/ui/widgets/share_questions_card_item.dart';

import '../../../core/routing/routes.dart';

class ShareQuestionsScreen extends StatelessWidget {
  const ShareQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: ShareQuestionsAppBar(),
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 15.w),
            child: ListView.separated(
                itemBuilder: (context,index){
                  return ShareQuestionsCardItem();
                },
                separatorBuilder: (context,index){
                  return verticalSpace(20);
                },
                itemCount: 2
            ),
          )
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
