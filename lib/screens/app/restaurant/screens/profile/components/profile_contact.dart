import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/components/icons.dart';

class Contact extends StatelessWidget {
  final String phone, website;
  const Contact({Key key, this.phone, this.website}) : super(key: key);
  // Future<void> _launched;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            contact,
            style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
            padding: EdgeInsets.all(5),
            child: Row(children: <Widget>[
              Cursor(),
              SizedBox(width: 10),
              Text(
                gothere,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: kTextLightColor),
              ),
            ]),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
              padding: EdgeInsets.all(5),
              child: Row(children: <Widget>[
                Globe(),
                SizedBox(width: 10),
                Text(
                  website,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: kTextLightColor),
                ),
              ]),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
            padding: EdgeInsets.all(5),
            child: Row(children: <Widget>[
              Tele(),
              SizedBox(width: 10),
              Text(
                phone,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: kTextLightColor),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
