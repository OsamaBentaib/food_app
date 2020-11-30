import 'package:flutter/material.dart';
import 'package:food_app/screens/app/personel/navigation.dart';
import 'package:food_app/screens/app/restaurant/navigation.dart';

class MyStatefulWidget extends StatelessWidget {
  final ref;
  const MyStatefulWidget({Key key, this.ref}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (ref == 0) {
      return PersonelNavigationScreen();
    } else if (ref == 1) {
      return RestaurantNavigationScreen();
    } else {
      return RestaurantNavigationScreen();
    }
  }
}
