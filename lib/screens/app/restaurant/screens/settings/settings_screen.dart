import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/connection/api_connection.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/profile_model.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/body.dart';
import 'package:food_app/constants.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ApiConnection api = ApiConnection();
  bool isLoaded = false;
  load() async {
    try {
      await api.getRestaurant();
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    load();
  }

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
                text: "Settings",
                style: TextStyle(color: kTextColor),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: api.getRestaurantFromSharedPref(),
        builder: (BuildContext context,
            AsyncSnapshot<RestaurantProfileModel> snapshot) {
          RestaurantProfileModel data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            print("-----from-------");
            print(data.name);
            return Body(data: data);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
