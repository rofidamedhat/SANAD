
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // 👈 تأكدي من وجود هذا الـ import
import 'package:sanad/core/di/dependency_injection.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/core/widgets/app_text_button.dart';
import 'package:sanad/feature/add_question/data/model/add_post_data_model/add_post_response_data.dart';
import 'package:sanad/feature/chatting/data/model/chat_model.dart';
import 'package:sanad/feature/chatting/data/model/fb_user_model.dart';
import 'package:sanad/feature/chatting/logic/cubit/chat_cubit.dart';
import 'package:sanad/feature/chatting/ui/chat_details_screen.dart';

class ContactNowButton extends StatefulWidget {
  final AddPostResponseData addPostResponseData;

  const ContactNowButton({super.key, required this.addPostResponseData});

  @override
  State<ContactNowButton> createState() => _ContactNowButtonState();
}

class _ContactNowButtonState extends State<ContactNowButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : AppTextButton(
            buttonText: "تواصل الان",
            textStyle: TextStyles.font20WhiteMedium,
            onPressed: () async {
              setState(() {
                isLoading = true;
              });

              try {
                final chatCubit = getIt<ChatCubit>();
                await chatCubit.getMyData();
                final receiver = FbUserModel(
                  uId: widget.addPostResponseData.userId.toString(),
                  name: widget.addPostResponseData.userName,
                  image: widget.addPostResponseData.profileImageUrl,
                  email: '',
                  role: '',
                );

                await chatCubit.createOrGetChat(receiver);

                final myId = chatCubit.currentUser?.uId ?? "";
                final receiverId = widget.addPostResponseData.userId.toString();
                List<String> ids = [myId, receiverId];
                ids.sort();
                String chatId = ids.join('_');

                if (!mounted) return;

                // 4. 🔥 التعديل هنا: نغطي الشاشة الجديدة بالـ Cubit اللي لسه مشغلينه
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: chatCubit, // باصينا الـ Cubit بأمان للشاشة التانية 🎯
                      child: ChatDetailsScreen(
                        chatModel: ChatModel(
                          chatId: chatId,
                          receiverId: receiverId,
                          receiverName: widget.addPostResponseData.userName,
                          receiverImage: widget.addPostResponseData.profileImageUrl,
                          uIds: ids,
                          lastMessage: "ابدأ المحادثة الآن?????",
                          lastTime: DateTime.now().toString(),
                        ),
                      ),
                    ),
                  ),
                );
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("عذراً، حدث خطأ: $e")),
                  );
                }
              } finally {
                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
              }
            },
            buttonWidth: 161,
            borderRadius: 30,
          );
  }
}