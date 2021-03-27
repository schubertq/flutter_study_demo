import 'package:flutter/material.dart';
import './message_item.dart';
import '../common/http_service.dart';

class MessagePage extends StatefulWidget {

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive =>true;

  // List messageData;
  TextEditingController controller = TextEditingController();

  // @override
  // void initState() {
  //   getMessagePageData().then((value) {
  //     Map result = value.data;
  //     setState(() {
  //       messageData = result['content'];
  //     });
  //   });

  //   super.initState();
  // }

  _popupMenuItem(String title, {String imagePath,IconData icon}){
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          imagePath != null
            ? Image.asset(
            imagePath,
            width: 32.0,
            height: 32.0,
          ): SizedBox(
            width: 32.0,
            height: 32.0,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
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
        title: Text('消息',
          style: TextStyle(color:Color(0xffffffff))
        ),
        centerTitle: true,
        brightness: Brightness.dark,
        actions: <Widget>[
          Container(
            child: IconButton(
              color: Colors.white,
              highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
              icon: ImageIcon(AssetImage("images/tab_recent_camera.png")),
              iconSize:24,
              onPressed: () {
                Navigator.of(context).pushNamed('/download');
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 13.0),
            child: IconButton(
              color: Colors.white,
              highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
              icon: ImageIcon(AssetImage("images/right_menu_nor.png")),
              iconSize:24,
              onPressed: () {
                showMenu(context: context,
                  position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                  items: <PopupMenuEntry>[
                    _popupMenuItem('创建群聊',imagePath: 'images/icon_menu_group.png'),
                    _popupMenuItem('加好友/群',imagePath: 'images/icon_menu_addfriend.png'),
                    _popupMenuItem('扫一扫',imagePath: 'images/icon_menu_scan.png'),
                    _popupMenuItem('面对面快传',icon: Icons.crop_free),
                    _popupMenuItem('收付款',icon: Icons.email),
                  ],
                );
              },
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: getMessagePageData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Map result = snapshot.data;
            List messageData = result['data'];
            return ListView.builder(
              itemCount: messageData.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.search),
                          title: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                                hintText: '搜索', border: InputBorder.none),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return MessageItem(messageData[index - 1]);
                }
              }
            );
          } else {
            return Center(
              child: Text('加载中...'),
            );
          }
        },
      )
    );
  }
}