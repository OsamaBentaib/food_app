import 'package:flutter/material.dart';
import 'package:food_app/screens/info/personel/person.dart';
import 'package:food_app/screens/info/restaurant/restaurant.dart';

class AddInfoScreen extends StatelessWidget {
  final int ref;
  const AddInfoScreen({Key key, this.ref}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ref == 0) {
      return Person();
    } else if (ref == 1) {
      return Restaurant();
    }
  }
}
