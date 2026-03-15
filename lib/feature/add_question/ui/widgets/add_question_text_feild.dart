import 'package:flutter/material.dart';

import '../../../../core/themeing/text_styles.dart';

class AddQuestionTextFeild extends StatefulWidget {
  TextEditingController controller;
   AddQuestionTextFeild({super.key, required this.controller});

  @override
  State<AddQuestionTextFeild> createState() => _AddQuestionTextFeildState();
}

class _AddQuestionTextFeildState extends State<AddQuestionTextFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      minLines: 1,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      style: TextStyles.font18Black05Bold,
      decoration: InputDecoration(
        hintText: "اكتب طلبك او سؤالك :",
        hintStyle: TextStyles.font14Gray85SemiBold,
        alignLabelWithHint: true,
        border: InputBorder.none,
      ),

    );
  }
}
