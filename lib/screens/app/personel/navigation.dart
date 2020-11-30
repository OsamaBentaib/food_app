import "package:flutter/material.dart";

import 'package:food_app/screens/app/personel/screens/home/home_screen.dart';

class PersonelNavigationScreen extends StatefulWidget {
  @override
  _PersonelNavigationScreenState createState() =>
      _PersonelNavigationScreenState();
}

class _PersonelNavigationScreenState extends State<PersonelNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Container(
        child: HomeScreen(),
      )),
    );
  }
}
