import "package:flutter/material.dart";
import 'package:food_app/screens/app/restaurant/screens/home/components/body.dart';
import 'package:food_app/constants.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            // ignore: deprecated_member_use
            .title
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "The",
            style: TextStyle(color: ksecondaryColor),
          ),
          TextSpan(
            text: "Chef",
            style: TextStyle(color: kPrimaryColor),
          ),
        ],
      ),
    ),
  ),
      body: Body(),
    );
  }
}


