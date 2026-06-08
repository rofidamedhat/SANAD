import 'package:flutter/material.dart';
import 'package:sanad/core/extensions/navigation.dart';
import 'package:sanad/core/routing/routes.dart';
import 'package:sanad/core/themeing/text_styles.dart';
import 'package:sanad/feature/chatting/data/model/chat_model.dart';
import 'package:sanad/feature/chatting/ui/widgets/image_widget.dart';

class ChatRowWidget extends StatelessWidget {
  const ChatRowWidget({super.key, required this.item});
  final ChatModel item;
  @override
  Widget build(BuildContext context) {
    // log("  للمحادث مع: ${item.receiverName} (معرف المحادثة: ${item.chatId})  ");
    return ListTile(
      onTap: () => context.pushNamed(Routes.chatDetailsScreen, arguments: item),
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      leading: ImageWidget(imageUrl: item.receiverImage),
      title: Text(
        item.receiverName ?? 'مستخدم غير معروف',
        style: TextStyles.font20Black05Bold,
      ),
      subtitle: Text(
        item.lastMessage ?? "ابدأ المحادثة الآن...",
        style: TextStyles.font14Gray85SemiBold,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),

      trailing: Text(
        _formatChatTime(item.lastTime),
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }

  String _formatChatTime(String? timeStr) {
    if (timeStr == null) return "";
    try {
      DateTime date = DateTime.parse(timeStr);
      String hour = date.hour > 12
          ? (date.hour - 12).toString()
          : date.hour.toString();
      String minute = date.minute.toString().padLeft(2, '0');
      String period = date.hour >= 12 ? "م" : "ص";
      return "$hour:$minute $period";
    } catch (e) {
      return "";
    }
  }
}
