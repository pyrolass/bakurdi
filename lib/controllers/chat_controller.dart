import 'package:bakurdi/models/chat.dart';
import 'package:flutter/material.dart';

class ChatController with ChangeNotifier {
  List<Chat> _chats = [];

  List<Chat> get chats => _chats;



  void addChat(Chat chat) {
    _chats.add(chat);
    notifyListeners();
  }


}
