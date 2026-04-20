import 'package:flutter/material.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/widgets/app_text_button.dart';
import 'package:sanad/feature/add_question/data/model/add_post_response_data.dart';

import '../../../../core/themeing/text_styles.dart';

class ShareQuestionsCardItemContent extends StatelessWidget {
  AddPostResponseData addPostResponseData;
   ShareQuestionsCardItemContent({super.key,required this.addPostResponseData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(addPostResponseData.profileImageUrl),
              radius: 30,
            ),
            horizontalSpace(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(addPostResponseData.userName,
                style: TextStyles.font20BlackMedium,
                ),
                Text(addPostResponseData.createdAtText,
                  style: TextStyles.font15Gray85Regular,
                ),
              ],
            )
          ],
        ),
        verticalSpace(20),
        Text(addPostResponseData.content,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyles.font15Black05Regular,
        ),
        verticalSpace(50),
        Center(
          child: AppTextButton(
              buttonText: "تواصل الان",
              textStyle: TextStyles.font20WhiteMedium,
              onPressed: (){},
            buttonWidth: 161,
            borderRadius: 30,
          ),
        )
      ],
    );
  }
}
