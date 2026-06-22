import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants.dart';
import 'package:sanad/core/di/dependency_injection.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/chatting/logic/cubit/chat_cubit.dart';
import 'package:sanad/feature/chatting/ui/widgets/app_bar_row.dart';
import 'package:sanad/feature/chatting/ui/widgets/chat_floating_button.dart';
import 'package:sanad/feature/chatting/ui/widgets/recent_chats_list_view.dart';
import 'package:sanad/feature/chatting/ui/widgets/search_bar_widget.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final ChatCubit _chatCubit = getIt<ChatCubit>();

  @override
  void initState() {
    super.initState();
    _chatCubit.getMyData();
    _chatCubit.getUsersList();
    _chatCubit.getRecentChats();
    if (isEditProfile) {
      _chatCubit.getMyData();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("==============🖥️ ChatsScreen BUILD is running right now!");
    return BlocProvider.value(
      value: _chatCubit,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                automaticallyImplyLeading: false,
                flexibleSpace: SafeArea(child: AppBarRow()),
              );
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "المحادثات",
                  style: TextStyles.font30BlackBold,
                  textAlign: TextAlign.right,
                ),
              ),
              SearchBarWidget(),
              RecentChatsListView(),
            ],
          ),
        ),
        floatingActionButton: ChatFloatingButton(),
      ),
    );
  }
}
