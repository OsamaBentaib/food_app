import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class Address extends StatelessWidget {
  final String address;
  const Address({Key key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Address",
            style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          ),
          Text(
            address,
            style: TextStyle(color: Colors.grey, height: 1.4),
          ),
        ],
      ),
    );
  }
}
