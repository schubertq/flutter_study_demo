import 'package:flutter/material.dart';
import './common/list_view_item.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName:
                Text('peter', style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text('99999999@qq.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2806304028,4032687163&fm=27&gp=0.jpg'),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573686319950&di=055d62ca883a19a6baf7e4555b614b01&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F02%2F30%2F03%2F58577642a4e4052.jpg'),
                fit: BoxFit.cover
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListViewItem(icon: 'images/dynamic_game.png', title: '了解会员特权'),
                ListViewItem(icon: 'images/dynamic_read.png', title: '我的QQ钱包'),
                ListViewItem(icon: 'images/dynamic_story.png', title: '我的个性装扮'),
                ListViewItem(icon: 'images/dynamic_gouwu.png', title: '我的收藏'),
                ListViewItem(icon: 'images/dynamic_comic.png', title: '我的相册'),
                ListViewItem(icon: 'images/dynamic_nowlive.png', title: '我的文件'),
                ListViewItem(icon: 'images/dynamic_qegame.png', title: '免流量特权')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
