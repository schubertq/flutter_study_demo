import 'package:flutter/material.dart';
import './contact_sider_list.dart';
import './contact_item.dart';
import '../models/public_account_model.dart';

class PublickAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactSiderList(
          items: publicAccountData,
          itemBuilder:  (BuildContext context, int index){
            return Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: ContactItem(item:publicAccountData[index]),
            );
          },
          sectionBuilder: (BuildContext context, int index){
            return Container(
              height: 32.0,
              padding: const EdgeInsets.only(left:14.0),
              color: Colors.grey[300],
              alignment: Alignment.centerLeft,
              child: Text(
                publicAccountData[index]['sectionKey'],
                style: TextStyle(fontSize: 14.0,color: Color(0xff909090)),
              ),
            );
          },
      ),
    );
  }
}
