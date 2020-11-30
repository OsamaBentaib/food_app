import 'package:flutter/material.dart';
import 'package:food_app/screens/app/personel/screens/descover/components/filter.dart';
import 'package:food_app/screens/app/personel/screens/descover/components/start.dart';
// import 'package:food_app/screens/app/home/components/slider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Start(),
           Filter(),
        ],
      ),
    );
  }
}


