import 'package:chatui/Styles/colors.dart';
import 'package:chatui/Styles/textStyles.dart';
import 'package:chatui/Views/AllCoversationsView.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  List<Widget> screens = [
    const AllConversationsView()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            top: BorderSide(color: lightBgcolor)
          )
        ),
        child: BottomNavigationBar(
          onTap: (int index) {

          },
          elevation: 1,
          useLegacyColorScheme: false,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle:
              bodyFontStyle.copyWith(fontSize: 10, color: lightParaColor),
          unselectedLabelStyle:
              bodyFontStyle.copyWith(fontSize: 10, color: lightParaColor),
          iconSize: 18,
          items: [
            BottomNavigationBarItem(
                label: "Chats",
                icon: Icon(
                  Icons.chat,
                  color: currentIndex == 0 ? primaryColor : Colors.grey,
                )),
            BottomNavigationBarItem(
                label: "Calls",
                icon: Icon(
                  Icons.call,
                  color: currentIndex == 1 ? primaryColor : Colors.grey,
                )),
            BottomNavigationBarItem(
                label: "Settings",
                icon: Icon(
                  Icons.settings,
                  color: currentIndex == 2 ? primaryColor : Colors.grey,
                )),
          ],
        ),
      ),      
    );
  }
}