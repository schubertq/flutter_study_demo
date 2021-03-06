import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Map item;
  final String titleName;
  final String imageName;

  ContactItem({this.item, this.titleName, this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.0,
      child: FlatButton(
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            imageName == null
                ? Image.network(
                    item['avatarUrl'] != ''
                        ? item['avatarUrl']
                        : 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540440519844&di=8cdc014d5fb6f11c62398dc245962373&imgtype=0&src=http%3A%2F%2Fwww.deyu.ln.cn%2Fimages%2Fobuwgnzoofuxs2lqnfrs4y3pnu%2Fimage%2F20150506%2Fe7%2F85%2Fv_109129752_m_601_480_270.jpg',
                    width: 36.0,
                    height: 36.0,
                    scale: 0.9,
                  )
                : Image.asset(
                    imageName,
                    width: 36.0,
                    height: 36.0,
                  ),
            Container(
              margin: const EdgeInsets.only(left: 12.0),
              child: Text(
                titleName == null ? item['name'] ?? '暂时':titleName,
                style: TextStyle(fontSize: 18.0,color: Color(0xFF353535)),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
