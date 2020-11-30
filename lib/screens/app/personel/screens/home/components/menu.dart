import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';



class MenuItem extends StatelessWidget {
  const MenuItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Text(
                  "Popular",
                  style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                ),
              Container(
                child: Container()
              ),
          ],
        ),
      ),
    );
  }
}


