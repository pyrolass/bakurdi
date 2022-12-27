class Chat {
  final String? id;
  final String? message;
  final bool isOwner;

  Chat({
    this.id,
    this.message,
    this.isOwner = true,
  });
}

List<Chat> chats = [
  Chat(id: '1', message: 'Chat 1', isOwner: true),
  Chat(id: '2', message: 'Chat 2', isOwner: false),
  Chat(id: '3', message: 'Chat 3', isOwner: true),
  Chat(id: '4', message: 'Chat 4', isOwner: false),
];
