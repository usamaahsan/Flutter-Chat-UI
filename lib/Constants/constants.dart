import 'package:chatui/Models/UserChat.dart';


UserProfile user = UserProfile(userId: 1, userName: "Emily J.", picture: "assets/images/people0.jpeg");

List<UserChat> chatSnippets = [
  UserChat(user: UserProfile(userId: 2, userName: "Ethan Matthews", picture: "assets/images/people1.jpeg",), chat: Chat(chatTime: "2024-03-06 14:55:31.919715", text: "Hey, did you hear about the new cafe opening downtown?", isSeen: true, senderId: 2)),
  UserChat(user: UserProfile(userId: 3, userName: "Sophia Ramirez", picture: "assets/images/people2.jpeg",), chat: Chat(chatTime: "2024-03-06 14:23:31.919715", text: "Just finished watching that new series you recommended. Mind-blowing ending!", isSeen: true, senderId: 3)),
  UserChat(user: UserProfile(userId: 4, userName: "Noah Patel", picture: "assets/images/people3.jpeg",), chat: Chat(chatTime: "2024-03-06 12:55:31.919715", text: "Sorry, can't make it to the party tonight. Got called into work last minute. Have fun for me!", isSeen: false, senderId: 4)),
  UserChat(user: UserProfile(userId: 5, userName: "Olivia Chang", picture: "assets/images/people4.jpeg",), chat: Chat(chatTime: "2024-03-05 16:12:31.919715", text: "Thanks for helping me with that assignment!", isSeen: true, senderId: 5)),
  UserChat(user: UserProfile(userId: 6, userName: "Liam Thompson", picture: "assets/images/people5.jpeg",), chat: Chat(chatTime: "2024-03-05 18:00:31.919715", text: "Hey, are you up for a hike this Saturday?", isSeen: false, senderId: 6)),
  UserChat(user:UserProfile(userId: 7, userName: "Ava Nguyen", picture: "assets/images/people6.jpeg",), chat: Chat(chatTime: "2024-03-04 10:22:31.919715", text: "Just landed in Paris! So excited for this trip.", isSeen: true, senderId: 7)),
  UserChat(user: UserProfile(userId: 8, userName: "Mason Rodriguez", picture: "assets/images/people7.jpeg",), chat: Chat(chatTime: "2024-03-02 10:22:31.919715", text: "Finished reading that book you lent me. Wow, what a ride! Let's grab coffee and discuss it sometime.", isSeen: true, senderId: 8)),
  UserChat(user: UserProfile(userId: 9, userName: "Isabella Khan", picture: "assets/images/people8.jpeg",), chat: Chat(chatTime: "2024-03-01 20:55:31.919715", text: "Hey, are you free tomorrow evening? I need some advice on choosing a birthday gift for my sister.", isSeen: true, senderId: 9)),
  UserChat(user: UserProfile(userId: 10, userName: "Jackson Martinez", picture: "assets/images/people9.jpeg",), chat: Chat(chatTime: "2024-03-01 20:10:31.919715", text: "Can't believe our team won the championship!", isSeen: true, senderId: 10)) , 
  UserChat(user: UserProfile(userId: 11, userName: "Emma Kim", picture: "assets/images/people10.jpeg",), chat: Chat(chatTime: "2024-03-01 23:12:31.919715", text: "Finally got around to trying out that new recipe you shared. It was a hit! Thanks for the inspiration.", isSeen: false, senderId: 11)) , 
];


List<Chat> demoChat = [
Chat(chatTime: "2024-03-03 14:55:31.919715", text: "Hey, how's it going?", isSeen: true, senderId: 2),
Chat(chatTime: "2024-03-03 14:55:31.919715", text: "Not much, just chilling. How about you?", isSeen: true, senderId: 1),
Chat(chatTime: "2024-03-03 14:55:31.919715", text: "Same here. Just relaxing after a long day.", isSeen: true, senderId: 2),
Chat(chatTime: "2024-03-03 14:55:31.919715", text: "Anything exciting happen today?.", isSeen: true, senderId: 1),
Chat(chatTime: "2024-03-04 14:55:31.919715", text: "Nah, just the usual routine. What about you?", isSeen: true, senderId: 2),
Chat(chatTime: "2024-03-04 14:55:31.919715", text: "Just work stuff. Nothing too thrilling.", isSeen: true, senderId: 2),
Chat(chatTime: "2024-03-05 14:55:31.919715", text: "We should plan something fun for the weekend.", isSeen: true, senderId: 1),
Chat(chatTime: "2024-03-05 14:55:31.919715", text: "Definitely! I'm down for whatever.", isSeen: true, senderId: 2),
Chat(chatTime: "2024-03-06 14:55:31.919715", text: "Great! Let's brainstorm some ideas.", isSeen: true, senderId: 2),
Chat(chatTime: "2024-03-06 14:55:31.919715", text: "Sounds good. Can't wait!", isSeen: true, senderId: 1),
];


String getDateFromChat(String date){
  String result = "";
  DateTime tempDate =  DateTime.parse(date);
  DateTime today = DateTime.now();

  if(today.difference(tempDate).inDays == 0){
    result = "Today";
  }
  else if(today.difference(tempDate).inDays == 1){
    result = "Yesterday";
  }
  else{
    result = "${tempDate.year}-${tempDate.month}-${tempDate.day}";
  }

  return result;
}
