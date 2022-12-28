class Chat {
  final String? message;
  final bool isOwner;

  Chat({
    this.message,
    this.isOwner = false,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        message: json["text"],
      );
}
