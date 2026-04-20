import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/helper/strings.dart';
import 'package:sanad/core/widgets/app_text_button.dart';
import 'package:sanad/feature/add_question/logic/add_post_cubit.dart';
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
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text("اضافة سؤال", style: TextStyles.font26green69Bold),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.greenA4, size: 40),
        ),
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
                  AppTextButton(
                      buttonText: "نشر",
                      textStyle: TextStyles.font20WhiteMedium,
                      onPressed: (){
                      setState(() {
                        if(controller.text.isEmpty){
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              icon: const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 32,
                              ),
                              content: Text(
                                "لا يمكن نشر رساله فارغة",
                                style: TextStyles.font20Black05Regular,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: Text(
                                    'حسنا',
                                    style: TextStyles.font20Black05Regular,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        else{
                          context.read<AddPostCubit>().addPost({
                            "content":controller.text
                          });
                        }
                      });
                      },
                      borderRadius: 25,
                  ),
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
