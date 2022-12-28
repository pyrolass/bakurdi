import 'package:bakurdi/controllers/chat_controller.dart';
import 'package:bakurdi/helpers/helper_functions.dart';
import 'package:bakurdi/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';

class BottomChat extends StatefulWidget {
  const BottomChat({super.key});

  @override
  State<BottomChat> createState() => _BottomChatState();
}

class _BottomChatState extends State<BottomChat> {
  TextEditingController chatController = TextEditingController();

  SpeechToText speech = SpeechToText();
  bool isListening = false;
  double confidence = 1.0;

  @override
  void dispose() {
    super.dispose();
    chatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              IconButton(
                onPressed: () async {
                  setState(() {
                    isListening = !isListening;
                  });
                  if (isListening) {
                    await startListening(speech);
                    speech.listen(
                      onResult: (res) {
                        chatController.text = res.recognizedWords;
                      },
                    );
                  } else {
                    await stopListening(speech);
                  }
                },
                icon: Icon(Icons.mic,
                    color: isListening ? Colors.blue : Colors.grey),
              ),
              Expanded(
                flex: 4,
                child:
                    Consumer<ChatController>(builder: (context, controller, _) {
                  return TextField(
                    controller: chatController,
                    onSubmitted: (val) async {
                      if (chatController.text.isNotEmpty) {
                        controller.addChat(Chat(
                          message: chatController.text,
                          isOwner: true,
                        ));

                        controller.sendMessage(chatController.text);
                      }
                      chatController.clear();
                    },
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                    ),
                  );
                }),
              ),
              Consumer<ChatController>(builder: (context, controller, _) {
                return IconButton(
                  onPressed: () async {
                    if (chatController.text.isNotEmpty) {
                      controller.addChat(Chat(
                        message: chatController.text,
                        isOwner: true,
                      ));
                      controller.sendMessage(chatController.text);
                    }
                    FocusScope.of(context).unfocus();
                    chatController.clear();
                  },
                  icon: const Icon(Icons.send),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
