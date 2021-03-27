import 'package:flutter/material.dart';
import 'package:flutter_qq/drawer_page.dart';
import './message/message_page.dart';
import './contacts/contacts_page.dart';
import './read_in_joy/read_in_joy_page.dart';
import './dynamics/dynamics_page.dart';

enum ItemType { GroupChat, AddFriends, QrCode, Payments, Help}

class App extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<App> {
  var _currentIndex = 0;

  MessagePage messagePage;
  ContactsPage contactsPage;
  ReadInJoyPage readInJoyPage;
  DynamicsPage dynamicsPage;

  final List<Widget> tabBodies = [
    MessagePage(),
    ContactsPage(),
    ReadInJoyPage(),
    DynamicsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: DrawerPage(),
        body: IndexedStack(
          index: _currentIndex,
          children: tabBodies
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: ((index) {
            setState(() {
              _currentIndex = index;
            });
          }),
          items: [
            BottomNavigationBarItem(
              title: Text(
                '消息',
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(0xff000000)
                        : Color(0xff888888)),
              ),
              icon: _currentIndex == 0
                  ? Image.asset(
                      'images/tab_recent_press.png',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'images/tab_recent_nor.png',
                      width: 32.0,
                      height: 28.0,
              )),
            BottomNavigationBarItem(
              title: Text(
                '联系人',
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Color(0xff000000)
                        : Color(0xff888888)),
              ),
              icon: _currentIndex == 1
                  ? Image.asset(
                'images/tab_qworld_press.png',
                width: 32.0,
                height: 28.0,
              )
                  : Image.asset(
                'images/tab_qworld_nor.png',
                width: 32.0,
                height: 28.0,
              )),
            BottomNavigationBarItem(
              title: Text(
                '看点',
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Color(0xff000000)
                        : Color(0xff888888)),
              ),
              icon: _currentIndex == 2
                  ? Image.asset(
                'images/tab_see_press.png',
                width: 32.0,
                height: 28.0,
              )
                  : Image.asset(
                'images/tab_see_nor.png',
                width: 32.0,
                height: 28.0,
              )),
            BottomNavigationBarItem(
              title: Text(
                '动态',
                style: TextStyle(
                    color: _currentIndex == 3
                        ? Color(0xff000000)
                        : Color(0xff888888)),
              ),
              icon: _currentIndex == 3
                  ? Image.asset(
                'images/tab_buddy_press.png',
                width: 32.0,
                height: 28.0,
              )
                  : Image.asset(
                'images/tab_buddy_nor.png',
                width: 32.0,
                height: 28.0,
              )),
          ],
        ),
      )
    );
  }
}
