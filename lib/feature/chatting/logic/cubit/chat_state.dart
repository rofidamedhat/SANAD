part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class UsersLoaded extends ChatState {
  final List<FbUserModel> users;
  UsersLoaded({required this.users});
}
class GetMyDataSuccessState extends ChatState {}
class RecentChatsLoaded extends ChatState {
  final List<ChatModel> recentChats;
  RecentChatsLoaded({required this.recentChats});
}

class ChatCreatedSuccess extends ChatState {
  final String chatId;
  ChatCreatedSuccess({required this.chatId});
}

class ChatError extends ChatState {
  final String message;
  ChatError({required this.message});
}


class GetMessagesSuccessState extends ChatState {}

class GetMessagesLoadingState extends ChatState {}

class ChatRoomReady extends ChatState {
  final ChatModel chatModel;
  ChatRoomReady({required this.chatModel});
}