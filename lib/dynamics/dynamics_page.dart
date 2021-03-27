import 'package:flutter/material.dart';
import '../common/list_view_item.dart';
import '../common/http_service.dart';

class DynamicsPage extends StatelessWidget {
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
        title: Text('动态',
          style:TextStyle(color:Color(0xffffffff))
        ),
        centerTitle: true,
        brightness: Brightness.dark,
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 13.0),
            child: IconButton(
              color: Colors.white,
              highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
              icon: ImageIcon(AssetImage("images/nav_icon_setting.png"),
              ),
              iconSize:24,
              onPressed: () {
                
              },
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: getDynamicPageData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Map result = snapshot.data;
            List messageList = result['data'];
            return ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  color: Colors.white,
                  child: ListViewItem(imagePath: messageList[0]['icon'], title: messageList[0]['name']),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      ListViewItem(imagePath: messageList[1]['icon'], title: messageList[1]['name']),
                      ListViewItem(imagePath: messageList[2]['icon'], title: messageList[2]['name']),
                      ListViewItem(imagePath: messageList[3]['icon'], title: messageList[3]['name'])
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      ListViewItem(imagePath: messageList[4]['icon'], title: messageList[4]['name']),
                      ListViewItem(imagePath: messageList[5]['icon'], title: messageList[5]['name']),
                      ListViewItem(imagePath: messageList[6]['icon'], title: messageList[6]['name']),
                      ListViewItem(imagePath: messageList[7]['icon'], title: messageList[7]['name']),
                      ListViewItem(imagePath: messageList[8]['icon'], title: messageList[8]['name']),
                      ListViewItem(imagePath: messageList[9]['icon'], title: messageList[9]['name']),
                      ListViewItem(imagePath: messageList[10]['icon'], title: messageList[10]['name']),
                      ListViewItem(imagePath: messageList[11]['icon'], title: messageList[11]['name']),
                      ListViewItem(imagePath: messageList[12]['icon'], title: messageList[12]['name']),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      ListViewItem(imagePath: messageList[13]['icon'], title: messageList[13]['name']),
                      ListViewItem(imagePath: messageList[14]['icon'], title: messageList[14]['name']),
                      ListViewItem(imagePath: messageList[15]['icon'], title: messageList[15]['name']),
                      ListViewItem(imagePath: messageList[16]['icon'], title: messageList[16]['name'])
                    ],
                  ),
                ),
              ],
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