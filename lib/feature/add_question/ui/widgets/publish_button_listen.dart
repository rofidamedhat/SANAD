import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/constants.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/feature/add_question/logic/add_post_cubit.dart';

import '../../../../core/themeing/colors.dart';
import '../../../../core/themeing/text_styles.dart';

class PublishButtonListen extends StatelessWidget {
  const PublishButtonListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPostCubit,AddPostState>(
        listener: (context,state){

          if(state is AddPostLoading){
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.green69,
                ),
              ),
            );
          }
          else if(state is AddPostWithError){
            setupErrorState(context, state.apiErrorModel.message!);
          }
          else if(state is AddPostSuccessfully){
            context.pop();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 32,
                ),
                content: Text(
                 state.addPostResponseBody.message,
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
        },
        child:SizedBox.shrink()
    );
  }
}
