import 'package:flutter/material.dart';

class MessageDetailPage extends StatefulWidget {
  final Map message;
  MessageDetailPage({Key key, @required this.message}) : super(key: key);
  // MessageDetailPage(this.message);

  @override
  _MessageDetailPageState createState() => new _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.message['title'],
          style:TextStyle(color:Color(0xffffffff))
        ),
        brightness: Brightness.dark,
        centerTitle: true
      )
    );
  }
}