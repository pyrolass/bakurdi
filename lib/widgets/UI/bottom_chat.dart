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
