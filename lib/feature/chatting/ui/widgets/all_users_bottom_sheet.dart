import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/chatting/data/model/fb_user_model.dart';
import 'package:sanad/feature/chatting/logic/cubit/chat_cubit.dart';
import 'package:sanad/feature/chatting/ui/widgets/image_widget.dart';

class AllUsersBottomSheet extends StatelessWidget {
  const AllUsersBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text("ابدأ محادثة مع ...", style: TextStyles.font18Black05Bold),
          horizontalSpace(15),
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var cubit = context.read<ChatCubit>();

                List<FbUserModel> filteredUsers = cubit
                    .getUsersNotChattedWith();

                if (filteredUsers.isEmpty) {
                  return Center(
                    child: Text(
                      "لقد بدأت محادثات مع جميع المستخدمين!",
                      style: TextStyles.font16greyBold,
                    ),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: filteredUsers.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 0.51),
                  itemBuilder: (context, index) {
                    var user = filteredUsers[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 4),
                      leading: ImageWidget(imageUrl: user.image),
                      title: Text(
                        user.name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: _buildUserTypeTag(user.role),
                      onTap: () {
                        cubit.createOrGetChat(user);

                        log("اختياري لـ: ${user.name}");

                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTypeTag(String? type) {
    bool isVolunteer = type == 'Volunteer';
    return Row(
      children: [
        Icon(
          isVolunteer ? Icons.handshake : Icons.person,
          size: 14,
          color: isVolunteer ? Colors.blue : Colors.orange,
        ),
        const SizedBox(width: 4),
        Text(
          isVolunteer ? 'متطوع' : 'مستخدم أصم',
          style: TextStyle(
            color: isVolunteer ? Colors.blue : Colors.orange,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
