import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/helper/shared_pref_helper.dart';
import 'package:sanad/feature/chatting/data/model/chat_model.dart';
import 'package:sanad/feature/chatting/data/model/fb_user_model.dart';
import 'package:sanad/feature/chatting/data/model/message_model.dart';
import 'package:sanad/feature/chatting/data/service/fb_services.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._fireBaseService) : super(ChatInitial());
  final FireBaseService _fireBaseService;
  FbUserModel? currentUser;
  List<FbUserModel> allUsers = [];
  List<ChatModel> recentChats = [];
  List<MessageModel> messagesList = [];

  StreamSubscription? _recentChatsSubscription;

  Future<void> getMyData() async {
    print(
      "🕵️‍♂️ WHO CALLED getMyData ? StackTrace: ${StackTrace.current.toString().split('\n')[1]}",
    );

    emit(ChatLoading());
    try {
      String? myId = await SharedPrefHelper.getString("uId");
      if (myId != null) {
        currentUser = await _fireBaseService.getCurrentUserData(myId);

        if (currentUser != null) {
          getRecentChats();
          emit(GetMyDataSuccessState());
        } else {
          emit(ChatError(message: "Failed to load user profile"));
        }
      } else {
        emit(ChatError(message: "User ID not found in storage"));
      }
    } catch (e) {
      log("Error fetching my data: $e");
      emit(ChatError(message: e.toString()));
    }
  }

  void getUsersList() async {
    print(
      "🕵️‍♂️ WHO CALLED getUsersList ? StackTrace: ${StackTrace.current.toString().split('\n')[1]}",
    );
    emit(ChatLoading());
    try {
      String? myId = await SharedPrefHelper.getString("uId");
      if (myId != null) {
        _fireBaseService.getAllUsers(myId).listen((usersList) {
          if (isClosed) return;
          allUsers = usersList;
          emit(UsersLoaded(users: allUsers));
        });
      } else {
        emit(ChatError(message: "User ID not found in storage"));
      }
    } catch (e) {
      emit(ChatError(message: e.toString()));
    }
  }

  Future<void> createOrGetChat(FbUserModel receiver) async {
    print(
      "🕵️‍♂️ WHO CALLED createOrGetChat ? StackTrace: ${StackTrace.current.toString().split('\n')[1]}",
    );
    emit(ChatLoading());
    try {
      List<String> ids = [currentUser!.uId, receiver.uId];
      ids.sort();
      String chatId = ids.join('_');

      ChatModel chatModel = ChatModel(
        chatId: chatId,
        uIds: ids,
        lastMessage: "ابدأ المحادثة الآن...",
        lastTime: DateTime.now().toString(),
        receiverName: receiver.name,
        receiverImage: receiver.image,
        receiverId: receiver.uId,
      );

      await _fireBaseService.createOrGetChatRoom(chatModel.toMap());
      log("Chat Created or Retrieved: $chatId");
    } catch (e) {
      emit(ChatError(message: e.toString()));
    }
  }

  void getRecentChats() {
    if (currentUser?.uId == null) return;

    _recentChatsSubscription?.cancel();

    _recentChatsSubscription = _fireBaseService
        .getRecentChatsStream(currentUser!.uId)
        .listen((chats) {
          if (isClosed) return;

          List<ChatModel> processedChats = chats.map((chat) {
            log("معالجة الشات: ${chat.chatId} - المستخدمين فيه: ${chat.uIds}");
            String otherUserId = chat.uIds!.firstWhere(
              (id) => id != currentUser!.uId,
              orElse: () => "",
            );
            log("الطرف التاني في الشات هو: $otherUserId");
            try {
              var otherUser = allUsers.firstWhere(
                (user) => user.uId == otherUserId,
              );
              return chat.copyWith(
                receiverName: otherUser.name,
                receiverImage: otherUser.image,
                receiverId: otherUser.uId,
              );
            } catch (e) {
              log("Error in mapping: $e - UserID: $otherUserId");
              return chat;
            }
          }).toList();
          processedChats.sort(
            (a, b) => (b.lastTime ?? "").compareTo(a.lastTime ?? ""),
          );
          log("عدد الشاتات المعالجة: ${processedChats.length}");
          for (var chat in processedChats) {
            log("الشات: ${chat.chatId} | الاسم: ${chat.receiverName}");
          }
          emit(RecentChatsLoaded(recentChats: processedChats));
        });
  }

  List<FbUserModel> getUsersNotChattedWith(List<ChatModel> recentChats) {
    List<String> chattedUserIds = recentChats.map((chat) {
      return chat.uIds!.firstWhere((id) => id != currentUser!.uId);
    }).toList();

    return allUsers
        .where((user) => !chattedUserIds.contains(user.uId))
        .toList();
  }

  Future<void> sendMessage({
    required String chatId,
    required String receiverId,
    required String messageText,
  }) async {
    String? myId = await SharedPrefHelper.getString("uId");

    MessageModel message = MessageModel(
      senderId: myId ?? "",
      receiverId: receiverId,
      text: messageText,
      dateTime: DateTime.now().toString(),
    );

    try {
      await _fireBaseService.sendMessage(chatId: chatId, message: message);
      await FirebaseFirestore.instance.collection('chats').doc(chatId).update({
        'lastMessage': messageText,
        'lastTime': message.dateTime,
      });
    } catch (e) {
      log("Error: $e");
    }
  }

  void getMessages(String chatId) {
    print(
      "🕵️‍♂️ WHO CALLED getMessages ? StackTrace: ${StackTrace.current.toString().split('\n')[1]}",
    );
    _fireBaseService.getMessages(chatId).listen((messages) {
      if (isClosed) return;

      messagesList = messages;
      log("Messages Updated: ${messagesList.length} messages");

      emit(GetMessagesSuccessState());
    });
  }

  @override
  Future<void> close() {
    _recentChatsSubscription?.cancel();
    return super.close();
  }
}

//الكود القيديم الي ف get recent chat
    // void getRecentChatss() {
  //   print(
  //     "🕵️‍♂️ WHO CALLED getRecentChats ? StackTrace: ${StackTrace.current.toString().split('\n')[1]}",
  //   );
  //   if (currentUser?.uId == null) return;

  //   // 👈 لو فيه مستمع قديم شغال، اقفله فوراً قبل ما تفتح جديد
  //   _recentChatsSubscription?.cancel();

  //   _recentChatsSubscription = FirebaseFirestore.instance
  //       .collection('chats')
  //       .where('uIds', arrayContains: currentUser?.uId)
  //       .snapshots()
  //       .listen((event) {
  //         if (isClosed) return;

  //         recentChats.clear();

  //         for (var doc in event.docs) {
  //           var chat = ChatModel.fromJson(doc.data());
  //           if (chat.receiverId == currentUser?.uId) {
  //             String otherUserId = chat.uIds!.firstWhere(
  //               (id) => id != currentUser?.uId,
  //               orElse: () => "",
  //             );
  //             try {
  //               var otherUser = allUsers.firstWhere(
  //                 (user) => user.uId == otherUserId,
  //               );
  //               chat = chat.copyWith(
  //                 receiverName: otherUser.name,
  //                 receiverImage: otherUser.image,
  //                 receiverId: otherUser.uId,
  //               );
  //             } catch (e) {
  //               log("الشخص التاني مش موجود في قائمة allUsers");
  //             }
  //           }

  //           recentChats.add(chat);
  //         }

  //         // ترتيب الشاتات بأمان مع الـ Null
  //         recentChats.sort(
  //           (a, b) => (b.lastTime ?? "").compareTo(a.lastTime ?? ""),
  //         );
  //         emit(RecentChatsLoaded(recentChats: List.from(recentChats)));
  //       });
  // }

  // List<FbUserModel> getUsersNotChattedWith() {
  //   print(
  //     "🕵️‍♂️ WHO CALLED getUsersNotChattedWith ? StackTrace: ${StackTrace.current.toString().split('\n')[1]}",
  //   );
  //   List<String?> chattedUserIds = recentChats
  //       .map((chat) => chat.receiverId)
  //       .toList();
  //   return allUsers.where((user) {
  //     return !chattedUserIds.contains(user.uId);
  //   }).toList();
  // }