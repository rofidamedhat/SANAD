import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/feature/chatting/logic/cubit/chat_cubit.dart';
import 'package:sanad/feature/chatting/ui/widgets/chat_row_widget.dart';

class RecentChatsListView extends StatelessWidget {
  const RecentChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          var cubit = context.read<ChatCubit>();

          if (state is ChatLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (cubit.recentChats.isEmpty) {
            return const Center(child: Text("ابدأ المحادثة الآن"));
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: cubit.recentChats.length,
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              indent: 15,
              endIndent: 20,
              color: Color(0xFFE0E0E0),
            ),
            itemBuilder: (context, index) {
              var chat = cubit.recentChats[index];
              return ChatRowWidget(item: chat);
            },
          );
        },
      ),
    );
  }
}

