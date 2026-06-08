import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/helper/spaces.dart';
import 'package:sanad/core/themeing/colors.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/chatting/logic/cubit/chat_cubit.dart';
import 'package:sanad/feature/chatting/ui/widgets/image_widget.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              cubit.currentUser == null
                  ? const CircleAvatar(
                      radius: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : ImageWidget(imageUrl: cubit.currentUser?.image),
              horizontalSpace(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "أهلاً , ${cubit.currentUser?.name.split(' ')[0] ?? 'مستخدم'}",
                    style: TextStyles.font22Black05Bold,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      horizontalSpace(5),
                      Text("متصل الآن", style: TextStyles.font10Black05Bold),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    color: AppColors.green69,
                  ),
                  onPressed: () {},
                ),
              ),
              horizontalSpace(10),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                child: IconButton(
                  icon: const Icon(Icons.search, color: AppColors.green69),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
