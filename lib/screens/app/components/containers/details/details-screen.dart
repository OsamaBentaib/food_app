import 'package:flutter/material.dart';
import 'package:food_app/screens/app/components/containers/details/components/body.dart';
import 'package:food_app/screens/app/components/models/item_lists_models.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  MenuItemsListMd list;
  int id;
  DetailsScreen({this.list, this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("${list.title}"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Body(list: list, id: id),
    );
  }
}
