import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/helper/strings.dart';
import 'package:sanad/core/widgets/app_text_button.dart';
import 'package:sanad/feature/add_question/logic/add_post_cubit.dart';
import 'package:sanad/feature/add_question/ui/widgets/add_question_app_bar.dart';
import 'package:sanad/feature/add_question/ui/widgets/add_question_button.dart';
import 'package:sanad/feature/add_question/ui/widgets/add_question_text_feild.dart';
import 'package:sanad/feature/add_question/ui/widgets/publish_button_listen.dart';

import '../../../core/constants.dart';
import '../../../core/themeing/colors.dart';
import '../../../core/themeing/text_styles.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AddQuestionAppBar(),
      ),
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(40),
                  Center(
                    child: SizedBox(
                      child: Image.asset(addQuestionImage,
                      fit: BoxFit.cover,
                      ),
                      height: 150.h,
                      width: 250.w,
                    ),
                  ),
                  verticalSpace(35),
                  Container(
                    width: double.infinity,
                    height: 200,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.whitef5,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color:AppColors.grayC1,
                          blurRadius: 25,
                          offset: Offset(0, 12),
                        ),
                      ],
                    ),
                    child: AddQuestionTextFeild(controller:controller),
                  ),
                  verticalSpace(50),
                  AddQuestionButton(controller: controller),
                  verticalSpace(40),
                  PublishButtonListen()
                ],
              ),
            ),
          )
      ),
    );
  }
}
