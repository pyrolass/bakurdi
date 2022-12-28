import 'package:bakurdi/controllers/chat_controller.dart';
import 'package:bakurdi/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomChat extends StatefulWidget {
  const BottomChat({super.key});

  @override
  State<BottomChat> createState() => _BottomChatState();
}

class _BottomChatState extends State<BottomChat> {
  TextEditingController chatController = TextEditingController();
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
                onPressed: () {},
                icon: const Icon(Icons.mic),
              ),
              Expanded(
                flex: 4,
                child:
                    Consumer<ChatController>(builder: (context, controller, _) {
                  return TextField(
                    controller: chatController,
                    onSubmitted: (val) {
                      controller.addChat(
                        Chat(message: chatController.text),
                      );
                      chatController.clear();
                      FocusScope.of(context).unfocus();
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
                  onPressed: () {
                    controller.addChat(
                      Chat(message: chatController.text),
                    );
                    chatController.clear();
                    FocusScope.of(context).unfocus();
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
