import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/add_question/data/model/add_post_data_model/add_post_response_data.dart';
import 'package:sanad/feature/post_details/logic/post_details_cubit.dart';
import 'package:sanad/feature/post_details/ui/widgets/delete_button_listen.dart';
import 'package:sanad/feature/post_details/ui/widgets/post_details_app_bar.dart';

import '../../../core/helper/spaces.dart';
import '../../../core/widgets/app_text_button.dart';

class PostDetailsScreen extends StatelessWidget {
  AddPostResponseData addPostResponseData;

   PostDetailsScreen({ required this.addPostResponseData,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: PostDetailsAppBar(),
      ),
      body:Padding(
        padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(addPostResponseData.profileImageUrl),
                  radius: 50,
                ),
                horizontalSpace(30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(addPostResponseData.userName,
                      style: TextStyles.font22Black05Bold,
                    ),
                    Text(addPostResponseData.createdAtText,
                      style: TextStyles.font22greySemiBold,
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(50),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text(addPostResponseData.content,
                    style: TextStyles.font20Black05Regular,
                  ),
                ],
              ),
            ),
            verticalSpace(180),
            Center(
              child: AppTextButton(
                backgroundColor: Colors.red,
                buttonText: "حذف السؤال",
                textStyle: TextStyles.font20WhiteMedium,
                onPressed: (){
                  setupDeletePost(context);
                },
                buttonWidth: 180,
                borderRadius: 30,
              ),
            ),
            verticalSpace(40),
            Center(
              child: AppTextButton(
                buttonText: "الرجوع الى الشاشه الرئيسيه",
                textStyle: TextStyles.font20WhiteMedium,
                onPressed: (){
                  context.pop();
                },
               // buttonWidth: 200,
                borderRadius: 30,
              ),
            ),
            DeleteButtonListen()
          ],
        ),
      )
    );
  }
void setupDeletePost(BuildContext context){
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        "هل انت متاكد من حذف السؤال ",
        style: TextStyles.font20Black05Regular,
      ),
      actions: [
        TextButton(
          onPressed: () {
            dialogContext.pop();
            context.read<PostDetailsCubit>().deletePost({
              "id":addPostResponseData.id
            });
          },
          child: Text(
            'نعم',
            style: TextStyles.font20Black05Regular,
          ),
        ),
        TextButton(
          onPressed: () {
            dialogContext.pop();
          },
          child: Text(
            'لا',
            style: TextStyles.font20Black05Regular,
          ),
        ),
      ],
    ),
  );
}
}
