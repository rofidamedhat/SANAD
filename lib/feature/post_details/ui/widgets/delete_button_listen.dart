import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/feature/post_details/logic/post_details_cubit.dart';

import '../../../../core/constants.dart';
import '../../../../core/themeing/colors.dart';
import '../../../../core/themeing/text_styles.dart';

class DeleteButtonListen extends StatelessWidget {
  const DeleteButtonListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostDetailsCubit,PostDetailsState>(
        listener: (context,state){
          if(state is DeletePostLoading){
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.green69,
                ),
              ),
            );
          }
          else if(state is DeletePostWithError){
            setupErrorState(context, state.apiErrorModel.message!);
          }
          else if(state is DeletePostSuccessfully){
            context.pop();
            showDialog(
              context: context,
              builder: (dialogContext) => AlertDialog(
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 32,
                ),
                content: Text(
                  state.deletePostResponseBody.message,
                  style: TextStyles.font20Black05Regular,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      dialogContext.pop();
                      Navigator.of(context).pop(true);
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
