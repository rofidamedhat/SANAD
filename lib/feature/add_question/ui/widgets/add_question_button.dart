import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/extensions/navigation.dart';

import '../../../../core/themeing/text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../logic/add_post_cubit.dart';

class AddQuestionButton extends StatefulWidget {
  TextEditingController controller;
   AddQuestionButton({super.key,required this.controller});

  @override
  State<AddQuestionButton> createState() => _AddQuestionButtonState();
}

class _AddQuestionButtonState extends State<AddQuestionButton> {
  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonText: "نشر",
      textStyle: TextStyles.font20WhiteMedium,
      buttonWidth: 130,
      onPressed: (){
        setState(() {
          if(widget.controller.text.isEmpty){
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
              "content":widget.controller.text
            });
          }
        });
      },
      borderRadius: 25,
    );
  }
}
