import 'package:flutter/material.dart';
import 'package:food_app/screens/app/personel/screens/descover/components/categorie.item.dart';

class GategoriesList extends StatefulWidget {
  GategoriesList({Key key}) : super(key: key);

  @override
  _GategoriesListState createState() => _GategoriesListState();
}

class _GategoriesListState extends State<GategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         GategorieItem(ctcount: 120,ctname: "Fast Food",),
         GategorieItem(ctcount: 120,ctname: "Fast Food",),
         GategorieItem(ctcount: 120,ctname: "Fast Food",),
         GategorieItem(ctcount: 120,ctname: "Fast Food",),
         GategorieItem(ctcount: 120,ctname: "Fast Food",),
       ],
    );
  }
}