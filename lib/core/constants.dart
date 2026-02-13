import 'package:flutter/material.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/core/extensions/navigation.dart';
bool isLoginUser = false;
bool isVolunteer=false;
// class SharedPrefKeys {
//   static const String userToken = 'userToken';
// }
void setupErrorState(BuildContext context, String error) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
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
