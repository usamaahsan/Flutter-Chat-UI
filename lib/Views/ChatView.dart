import 'package:chatui/Constants/constants.dart';
import 'package:chatui/Models/UserChat.dart';
import 'package:chatui/Styles/colors.dart';
import 'package:chatui/Styles/margins.dart';
import 'package:chatui/Styles/textStyles.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  UserProfile chatUser;
  ChatView({required this.chatUser});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ScrollController _scrollController = ScrollController();
  double writeBoxHeight = 70;

  List<Chat> chatData = List.from(demoChat);
  TextEditingController messageText = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Scroll to the end of the list when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      goToBottom();
    });
  }

  void goToBottom(){
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
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
          toolbarHeight: 90,
          title: topBar(),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: chatPanel(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget topBar() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(widget.chatUser.picture),
          radius: 24,
        ),
        const SizedBox(
          width: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.chatUser.userName,
              style: headingFontStyle.copyWith(color: Colors.white),
              overflow: TextOverflow.clip,
            ),
            Text(
              "Online",
              style: bodyFontStyle.copyWith(color: Colors.white),
            )
          ],
        )
      ],
    );
  }

  Widget chatPanel() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            SizedBox(
              height: constraints.maxHeight - writeBoxHeight,
              child: ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.all(margin2),
                shrinkWrap: true,
                itemCount: chatData.length,
                itemBuilder: (context, index) {
                  return chatItem(chatData[index]);
                },
                separatorBuilder: (context, index) {
                  return chatTime(chatData[index]);
                },
              ),
            ),
            writeMessageBox()
          ],
        );
      },
    );
  }

  Widget chatItem(Chat chat) {
    return Align(
        alignment: chat.senderId == user.userId
            ? Alignment.topRight
            : Alignment.topLeft,
        child: Card(
          elevation: 0,
          color: chat.senderId == user.userId ? primaryColor : lightBgcolor,
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                chat.text,
                style: bodyFontStyle,
              )),
        ));
  }

  Widget chatTime(Chat chat) {
    return Align(
      alignment:
          chat.senderId == user.userId ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            getDateFromChat(chat.chatTime),
            style: body3FontStyle,
          )),
    );
  }

  Widget writeMessageBox() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: writeBoxHeight,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(
            left: margin, top: 0, bottom: margin2, right: margin),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.grey.shade400),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: primaryColor,
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                  child: TextFormField(
                controller: messageText,
                style: bodyFontStyle,
                decoration: const InputDecoration(
                    hintText: "Type Message", border: InputBorder.none),
              )),
              const SizedBox(
                width: 6,
              ),
              IconButton(
                icon: const Icon(
                  Icons.send,
                  color: Colors.black,
                ),
                onPressed: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
