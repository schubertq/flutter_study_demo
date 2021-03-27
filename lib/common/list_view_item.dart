import 'package:flutter/material.dart';
import './touch_callback.dart';

class ListViewItem extends StatelessWidget{
  final String title;
  final String imagePath;
  final String icon;

  ListViewItem({Key key,@required this.title,this.imagePath,this.icon}):super(key:key);

  @override
  Widget build(BuildContext context) {
    
    return TouchCallBack(
      onPressed: (){
        
      },
      child: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            Container(
              child: imagePath != null
                  ? Image.network(imagePath, width: 24.0, height: 24.0)
                  : Image.asset(icon, width: 24.0, height: 24.0),
              //     : SizedBox(
              //   height: 24.0,
              //   width: 24.0,
              //   child: icon,
              // ),
              margin: const EdgeInsets.only(left: 20.0,right: 16.0),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16.0,color: Color(0xFF353535)),
            ),
          ],
        ),
      ),
    );
  }
}