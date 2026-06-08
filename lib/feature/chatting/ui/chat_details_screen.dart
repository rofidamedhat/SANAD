import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/feature/chatting/data/model/chat_model.dart';
import 'package:sanad/feature/chatting/logic/cubit/chat_cubit.dart';
import 'package:sanad/feature/chatting/ui/widgets/chat_bubble_widget.dart';

class ChatDetailsScreen extends StatefulWidget {
  const ChatDetailsScreen({super.key, required this.chatModel});

  final ChatModel chatModel;
  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChatCubit>().getMessages(widget.chatModel.chatId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D6A61),
        leading: const BackButton(color: Colors.white),
        title: const Text('المحادثة', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var cubit = context.read<ChatCubit>();
                var messages = cubit.messagesList;
             
                if (cubit.messagesList.isEmpty) {
                  return const Center(child: Text("ابدأ المحادثة الآن.."));
                }
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    return ChatBubbleWidget(
                      text: msg.text,
                      isMe: msg.senderId == cubit.currentUser?.uId,
                      time: msg.dateTime.length > 16
                          ? msg.dateTime.substring(11, 16)
                          : "",
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.teal.shade100),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            controller: messageController,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: 'Type a message...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.attach_file,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    if (messageController.text.trim().isNotEmpty) {
                      context.read<ChatCubit>().sendMessage(
                        chatId: widget.chatModel.chatId!,
                        receiverId: widget.chatModel.receiverId!,
                        messageText: messageController.text.trim(),
                      );
                      messageController.clear();
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.green69,
                    radius: 20,
                    child: Center(child: Icon(Icons.send, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
