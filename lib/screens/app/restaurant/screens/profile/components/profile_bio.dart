import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class Bio extends StatelessWidget {
  final String bio;
  const Bio({Key key, this.bio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "About",
            style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          ),
          Text(
            bio,
            style: TextStyle(color: Colors.grey, height: 1.4),
          ),
        ],
      ),
    );
  }
}
