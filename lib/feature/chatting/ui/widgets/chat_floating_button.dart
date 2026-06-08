import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/feature/chatting/logic/cubit/chat_cubit.dart';
import 'package:sanad/feature/chatting/ui/widgets/all_users_bottom_sheet.dart';

class ChatFloatingButton extends StatelessWidget {
  const ChatFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (fabContext) {
        return FloatingActionButton(
          backgroundColor: AppColors.green69,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          elevation: 5,
          splashColor: Colors.white.withOpacity(0.3),
          onPressed: () {
            final cubit = BlocProvider.of<ChatCubit>(fabContext);
            showModalBottomSheet(
              context: fabContext,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (modalContext) => BlocProvider.value(
                value: cubit,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  child: const AllUsersBottomSheet(),
                ),
              ),
            );
          },
          child: Icon(
            Icons.add_comment_rounded,
            color: Colors.white,
            size: 28.sp,
          ),
        );
      },
    );
  }
}
