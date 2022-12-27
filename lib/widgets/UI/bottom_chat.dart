import 'package:flutter/material.dart';

class BottomChat extends StatefulWidget {
  const BottomChat({super.key});

  @override
  State<BottomChat> createState() => _BottomChatState();
}

class _BottomChatState extends State<BottomChat> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Type a message',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
