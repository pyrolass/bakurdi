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
        Container(
          constraints: const BoxConstraints(maxWidth: 200),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: isOwner ? Colors.blue : Colors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Directionality(
                  textDirection:
                      isOwner ? TextDirection.ltr : TextDirection.rtl,
                  child: Text(
                    message.trim(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
