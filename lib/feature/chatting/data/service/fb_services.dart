import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanad/feature/chatting/data/model/chat_model.dart';
import 'package:sanad/feature/chatting/data/model/fb_user_model.dart';
import 'package:sanad/feature/chatting/data/model/message_model.dart';

class FireBaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fbSyncUserDataFromProfile({
    required String uId,
    required String name,
    required String email,
    required String role,
    required String image,
  }) async {
    try {
      await _firestore.collection('users').doc(uId).set({
        'uId': uId,
        'name': name,
        'email': email,
        'role': role,
        'image': image,
        // 'lastSync': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      log("Done Syncing to Firebase ✅");
    } catch (e) {
      log("Firebase Sync Error: $e");
      rethrow;
    }
  }

  Stream<List<FbUserModel>> getAllUsers(String myId) {
    return _firestore
        .collection('users')
        .where('uId', isNotEqualTo: myId)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return FbUserModel.fromJson(doc.data());
          }).toList();
        });
  }

  Future<FbUserModel?> getCurrentUserData(String uId) async {
    try {
      var doc = await _firestore.collection('users').doc(uId).get();
      if (doc.exists && doc.data() != null) {
        return FbUserModel.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      log("Error getting current user data: $e");
      return null;
    }
  }

  Stream<List<MessageModel>> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('dateTime', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return MessageModel.fromJson(doc.data());
          }).toList();
        });
  }

  Future<void> sendMessage({
    required String chatId,
    required MessageModel message,
  }) async {
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toJson());
  }

  Future<void> createOrGetChatRoom(Map<String, dynamic> chatData) async {
    try {
      String chatId = chatData['chatId'];
      await _firestore
          .collection('chats')
          .doc(chatId)
          .set(chatData, SetOptions(merge: true));
      log("Chat room successfully sync'd in Firebase Service! ✅");
    } catch (e) {
      log("Error in Firebase Service while creating chat: $e");
      rethrow;
    }
  }

  Stream<List<ChatModel>> getRecentChatsStream(String myId) {
    return _firestore
        .collection('chats')
        .where('uIds', arrayContains: myId)
        .snapshots()
        .map((snapshot) {
          log("عدد الشاتات اللي رجعت من الفايربيز: ${snapshot.docs.length}"); // 👈 ضيفي السطر ده
          return snapshot.docs.map((doc) {
            return ChatModel.fromJson(doc.data());
          }).toList();
        });
  }
}
