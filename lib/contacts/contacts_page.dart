import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_qq/contacts/address_book_page.dart';
import 'package:flutter_qq/contacts/device_page.dart';
import 'package:flutter_qq/contacts/public_account_page.dart';
import './friend_page.dart';
import './friend_section_page.dart';
import './group_section_page.dart';
import './device_page.dart';
import './address_book_page.dart';
import './public_account_page.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive =>true;

  TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 0, length: 6);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2806304028,4032687163&fm=27&gp=0.jpg')
          ),
        ),
        elevation: 0.7,
        title: Text('联系人',
          style:TextStyle(color:Color(0xffffffff))
        ),
        centerTitle: true,
        brightness: Brightness.dark,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(text: "好友"),
            Tab(
              text: "分组",
            ),
            Tab(
              text: "群聊",
            ),
            Tab(text: "设备"),
            Tab(
              text: "通讯录",
            ),
            Tab(
              text: "公众号",
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 13.0),
            child: IconButton(
              color: Colors.white,
              highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
              icon: ImageIcon(AssetImage("images/nav_icon_add_friend.png"),
              ),
              iconSize:24,
              onPressed: () {
                
              },
            ),
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          FriendPage(),
          FriendSectionPage(),
          GroupSectionPage(),
          DevicePage(),
          AddressBookPage(),
          PublickAccountPage()
        ],
      )
    );
  }
}