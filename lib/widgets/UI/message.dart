import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  final bool isOwner;
  const Message({super.key, required this.message, required this.isOwner});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isOwner ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isOwner ? Colors.blue : Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
