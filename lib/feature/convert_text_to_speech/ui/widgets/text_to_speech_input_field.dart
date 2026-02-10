import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';

class TextToSpeechInputField extends StatefulWidget {
  TextEditingController controller;
   TextToSpeechInputField({super.key,
   required this.controller
   });

  @override
  State<TextToSpeechInputField> createState() => _TextToSpeechInputFieldState();
}

class _TextToSpeechInputFieldState extends State<TextToSpeechInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      minLines: 1,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      style: TextStyles.font18Black05Bold,
      decoration: InputDecoration(
        hintText: "اكتب رسالتك هنا لتحويلها إلى تسجيل صوتي",
        hintStyle: TextStyles.font14Gray85SemiBold,
       alignLabelWithHint: true,
       border: InputBorder.none,
      ),

    );
  }
}
