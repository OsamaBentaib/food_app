import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/components/containers/updateitem/components/body.dart';
class UpdateItem extends StatefulWidget {
  UpdateItem({Key key}) : super(key: key);

  @override
  _UpdateItemState createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
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
                  text: "Update",
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