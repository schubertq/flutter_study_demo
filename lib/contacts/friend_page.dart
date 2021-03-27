import 'package:flutter/material.dart';
import 'package:flutter_qq/common/http_service.dart';
import './contact_sider_list.dart';
import './contact_item.dart';

class FriendPage extends StatefulWidget {
  @override
  _FriendPageState createState() {
    return _FriendPageState();
  }
}

class _FriendPageState extends State<FriendPage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive =>true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getContactsPageData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Map result = snapshot.data;
            List friendData = result['data'];
            return ContactSiderList(
              items: friendData,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
                  alignment: Alignment.centerLeft,
                  child: ContactItem(item:friendData[index]),
                );
              },
              sectionBuilder: (BuildContext context, int index){
                return Container(
                  height: 32.0,
                  padding: const EdgeInsets.only(left:14.0),
                  color: Colors.grey[300],
                  alignment: Alignment.centerLeft,
                  child: Text(
                    friendData[index]['sectionKey'],
                    style: TextStyle(fontSize: 14.0,color: Color(0xff909090)),
                  ),
                );
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
