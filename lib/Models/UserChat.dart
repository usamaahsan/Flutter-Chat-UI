class UserChat{
  UserProfile user;
  Chat chat;

  UserChat({
    required this.user,
    required this.chat,
  });

}

class Chat{
  String chatTime;
  String text;
  bool isSeen;
  int senderId;

    Chat({
    required this.chatTime,
    required this.text,
    required this.isSeen,
    required this.senderId
  });
}

class UserProfile{
  int userId;
  String userName;
  String picture;

  UserProfile({
    required this.userId,
    required this.userName,
    required this.picture
  });

}

