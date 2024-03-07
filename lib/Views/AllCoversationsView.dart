import 'package:chatui/Constants/constants.dart';
import 'package:chatui/Models/UserChat.dart';
import 'package:chatui/Styles/colors.dart';
import 'package:chatui/Styles/margins.dart';
import 'package:chatui/Styles/textStyles.dart';
import 'package:chatui/Views/ChatView.dart';
import 'package:flutter/material.dart';

class AllConversationsView extends StatefulWidget {
  const AllConversationsView({super.key});

  @override
  State<AllConversationsView> createState() => _AllConversationsViewState();
}

class _AllConversationsViewState extends State<AllConversationsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: darkBgColor,
        appBar: AppBar(
          toolbarHeight: 100,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(user.picture),
                backgroundColor: primaryColor,
                radius: 24,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                user.userName,
                style: headingFontStyle.copyWith(color: Colors.white),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: body(),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        searchBar(),
        chatsBox(),
      ],
    );
  }

  Widget searchBar() {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: margin, right: margin, bottom: margin),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: bodyFontStyle,
            labelStyle: bodyFontStyle,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade600,
              size: 20,
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade100)),
          ),
        ),
      ),
    );
  }

  Widget chatsBox() {
    return Expanded(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: ListView.separated(
          itemCount: chatSnippets.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return snippet(chatSnippets[index]);
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0,
            );
          },
        ),
      ),
    );
  }

  Widget snippet(UserChat chat) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        contentPadding: const EdgeInsets.all(margin),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChatView(
              chatUser: chat.user,
            );
          }));
        },
        isThreeLine: true,
        leading: CircleAvatar(
          backgroundImage: AssetImage(chat.user.picture),
          radius: 18,
        ),
        title: Row(
          children: [
            Expanded(
                child: Text(
              chat.user.userName,
              style: heading2FontStyle,
              overflow: TextOverflow.ellipsis,
            )),
            Text(
              getDateFromChat(chat.chat.chatTime),
              style: chat.chat.isSeen == true
                  ? body2FontStyle
                  : heading3FontStyle.copyWith(color: Colors.blue),
            ),
          ],
        ),
        subtitle: Text(
          chat.chat.text,
          style: bodyFontStyle,
        ),
      ),
    );
  }
}
