import 'package:flutter/material.dart';

class ReadInJoyPage extends StatefulWidget{
  @override
  _ReadInJoyPageState createState() => new _ReadInJoyPageState();
}

class _ReadInJoyPageState extends State<ReadInJoyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('看点',
          style:TextStyle(color:Color(0xffffffff))
        ),
        brightness: Brightness.dark,
        centerTitle: true
      )
    );
  }
}