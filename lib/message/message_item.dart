import 'package:flutter/material.dart';
import '../common/touch_callback.dart';
import './message_detail_page.dart';

class MessageItem extends StatelessWidget{
  final Map message;
  MessageItem(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      color: Colors.white,
      child: TouchCallBack(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessageDetailPage(message: message)
              // builder: (context) => MessageDetailPage(message)
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 13.0,right: 13.0),
              child: Image.network(message['avatar'],width: 48.0,height: 48.0,),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message['title'],
                    style: TextStyle(fontSize: 16.0,color: Color(0xFF353535)),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                  ),
                  Text(
                    message['subTitle'],
                    style: TextStyle(fontSize: 14.0,color: Color(0xFFa9a9a9)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.only(right: 12.0,top: 12.0),
              child: Text(
                message['time'],
                style: TextStyle(fontSize: 14.0,color: Color(0xFFa9a9a9)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}