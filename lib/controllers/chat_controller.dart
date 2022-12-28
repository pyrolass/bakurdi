import 'package:bakurdi/constants/constants.dart';
import 'package:bakurdi/models/chat.dart';
import 'package:bakurdi/networking/api/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../networking/dio_exceptions.dart';

class ChatController with ChangeNotifier {
  final DioClient _dioClient = DioClient();

  List<Chat> _chats = [];
  List<Chat> get chats => _chats;

  bool _loading = false;
  bool get loading => _loading;

  void setIsLoading(bool value) {
    _loading = value;
  }

  void addChat(Chat chat) {
    _chats.add(chat);
    notifyListeners();
  }

  Future<List<Chat>> sendMessage(String message) async {
    print("object");
    setIsLoading(true);
    try {
      var response = await _dioClient.post(
        "https://api.openai.com/v1/engines/text-davinci-003/completions",
        data: {
          "prompt": message,
          "max_tokens": 150,
          "temperature": 0.9,
          "top_p": 1,
          "frequency_penalty": 0.0,
          "presence_penalty": 0.6,
          "stop": [" Human:", " AI:"]
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      if (response.statusCode == 200) {
        _chats.add(
          Chat.fromJson(
            response.data["choices"][0],
          ),
        );
      }
    } on DioError catch (e) {
      setIsLoading(true);
      final errorMessage = DioExceptions.fromDioError(e).toString();

      throw errorMessage;
    }
    setIsLoading(true);
    notifyListeners();
    return _chats;
  }
}
