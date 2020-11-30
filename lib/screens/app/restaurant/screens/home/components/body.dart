import 'package:flutter/material.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/restaurant_profile.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return RestaurantProfile(from: null);
  }
}
