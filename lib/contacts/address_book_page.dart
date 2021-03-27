import 'package:flutter/material.dart';
import '../models/address_book_model.dart';

class AddressBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addressBookData.length,
      itemBuilder: (context, i) => Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(addressBookData[i].avatarUrl),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        addressBookData[i].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        addressBookData[i].time,
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      )
                    ]
                  ),
                  subtitle: Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      addressBookData[i].message,
                      style: TextStyle(color: Colors.grey, fontSize: 15.0),
                    )
                  )
                )
              )
            ]
          )
    );
  }
}
