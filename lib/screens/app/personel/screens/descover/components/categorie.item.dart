import 'package:food_app/constants.dart';
import 'package:flutter/material.dart';



class GategorieItem extends StatelessWidget {
  final String ctname;
  final int ctcount;
  const GategorieItem({Key key, this.ctcount, this.ctname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border( top: BorderSide(width: 1, color: Colors.grey[200]),)
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  ctname,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: kTextColor,),
                ),
                Text(
                  "$ctcount Menu",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: kTextColor,),
                ),
              ],
            ),
          ),
    );
  }
}