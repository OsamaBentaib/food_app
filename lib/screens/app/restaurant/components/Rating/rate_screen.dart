import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/restaurant/components/Rating/components/body.dart';
class RatingScreen extends StatefulWidget {
  final String restauranttitle;
  RatingScreen({Key key, this.restauranttitle}) : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
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
                  .copyWith(fontWeight: FontWeight.w700),
              children: [
                TextSpan(
                  text: "Rate",
                  style: TextStyle(color: kTextLightColor),
                ),
              ],
            ),
          ),
        ),
      body: Body(),
    );
  }
}