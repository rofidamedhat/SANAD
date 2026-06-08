class ChatModel {
  String? chatId;
  List<String>? uIds;
  String? lastMessage;
  String? lastTime;
  String? receiverName;
  String? receiverImage;
  String? receiverId;

  ChatModel({
    this.chatId,
    this.uIds,
    this.lastMessage,
    this.lastTime,
    this.receiverName,
    this.receiverImage,
    this.receiverId,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    chatId = json['chatId'];
    uIds = List<String>.from(json['uIds']);
    lastMessage = json['lastMessage'];
    lastTime = json['lastTime'];
    receiverName = json['receiverName'];
    receiverImage = json['receiverImage'];
    receiverId = json['receiverId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'uIds': uIds,
      'lastMessage': lastMessage,
      'lastTime': lastTime,
      'receiverName': receiverName,
      'receiverImage': receiverImage,
      'receiverId': receiverId,
    };
  }

  ChatModel copyWith({
    String? chatId,
    List<String>? uIds,
    String? lastMessage,
    String? lastTime,
    String? receiverName,
    String? receiverImage,
    String? receiverId,
  }) {
    return ChatModel(
      chatId: chatId ?? this.chatId,
      uIds: uIds ?? this.uIds,
      lastMessage: lastMessage ?? this.lastMessage,
      lastTime: lastTime ?? this.lastTime,
      receiverName: receiverName ?? this.receiverName,
      receiverImage: receiverImage ?? this.receiverImage,
      receiverId: receiverId ?? this.receiverId,
    );
  }
}
