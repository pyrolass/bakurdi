import 'package:bakurdi/constants/constants.dart';
import 'package:bakurdi/models/chat.dart';
import 'package:bakurdi/networking/api/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../networking/dio_exceptions.dart';

class ChatController with ChangeNotifier {
  final DioClient _dioClient = DioClient();

  final List<Chat> _chats = [];
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
    String englishMessage = await translateToEnglish(message);

    setIsLoading(true);
    try {
      var response = await _dioClient.post(
        "https://api.openai.com/v1/engines/text-davinci-003/completions",
        data: {
          "prompt": englishMessage,
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
            "Authorization": "Bearer $chatToken"
          },
        ),
      );
      if (response.statusCode == 200) {
        String kurdishMessage =
            await translateToKurdish(response.data["choices"][0]["text"]);
        _chats.add(Chat(message: kurdishMessage));
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();

      throw errorMessage;
    }
    setIsLoading(false);
    notifyListeners();
    return _chats;
  }

  Future<String> translateToEnglish(String message) async {
    // we translate the text to english
    try {
      var response = await _dioClient.post(
        "https://translation.googleapis.com/language/translate/v2",
        data: {
          "q": message,
          "target": "en",
        },
        options: Options(
          headers: {"x-goog-api-key": translationToken},
        ),
      );
      if (response.statusCode == 200) {
        message = response.data["data"]["translations"][0]["translatedText"];
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();

      throw errorMessage;
    }

    return message;
  }

  Future<String> translateToKurdish(String message) async {
    // we translate the text to english
    try {
      var response = await _dioClient.post(
        "https://translation.googleapis.com/language/translate/v2",
        data: {
          "q": message,
          "target": "ckb",
        },
        options: Options(
          headers: {"x-goog-api-key": translationToken},
        ),
      );
      if (response.statusCode == 200) {
        message = response.data["data"]["translations"][0]["translatedText"];
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();

      throw errorMessage;
    }

    return message;
  }
}
