//ده بتاع المسدج الواحده اللي هتظهر جوا البابل

class MessageModel {
  final String senderId;
  final String receiverId;
  final String text;
  final String dateTime;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.dateTime,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderId: json['senderId'] ?? '',
      receiverId: json['receiverId'] ?? '',
      text: json['text'] ?? '',
      dateTime: json['dateTime'] ?? '',
    );
  }
  String get formattedTime {
    if (dateTime.isEmpty) return "";
    return dateTime.substring(11, 16);
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'dateTime': dateTime,
    };
  }
}
