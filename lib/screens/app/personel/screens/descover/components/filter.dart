import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/screens/descover/components/categories_list.dart';

class Filter extends StatefulWidget {
  Filter({Key key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white, 
          ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Container(
                         margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text(
                  "Popular Categories",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19, color: kTextColor,),
                ),
          ),
          GategoriesList(),
         ],
       ),
    );
  }
}