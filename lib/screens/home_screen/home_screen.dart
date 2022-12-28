import 'package:bakurdi/controllers/chat_controller.dart';
import 'package:bakurdi/widgets/UI/bottom_chat.dart';
import 'package:bakurdi/widgets/UI/message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bakurdi x ChatpGPT'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child:
                  Consumer<ChatController>(builder: (context, controller, _) {
                return ListView.builder(
                  itemCount: controller.chats.length,
                  itemBuilder: (context, index) {
                    return Message(
                      message: controller.chats[index].message ?? "No message",
                      isOwner: controller.chats[index].isOwner,
                    );
                  },
                );
              }),
            ),
            const BottomChat(),
          ],
        ),
      ),
    );
  }
}
