import 'package:bakurdi/models/chat.dart';
import 'package:bakurdi/widgets/UI/bottom_chat.dart';
import 'package:bakurdi/widgets/UI/message.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bakurdi x ChatpGPT'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return Message(
                  message: chats[index].message ?? "No message",
                  isOwner: chats[index].isOwner,
                );
              },
            ),
          ),
          const BottomChat(),
        ],
      ),
    );
  }
}
