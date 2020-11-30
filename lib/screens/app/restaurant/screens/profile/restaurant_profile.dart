import 'package:flutter/material.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/components/body.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/components/loading.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/connection/api_connection.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/profile_model.dart';

class RestaurantProfile extends StatefulWidget {
  final int from;

  const RestaurantProfile({Key key, this.from}) : super(key: key);
  @override
  _RestaurantProfileState createState() => _RestaurantProfileState(from);
}

class _RestaurantProfileState extends State<RestaurantProfile> {
  final int from;
  _RestaurantProfileState(this.from);
  ApiConnection api = ApiConnection();
  Future<RestaurantProfileModel> futureProfile;
  bool isLoaded = false;
  load() async {
    try {
      await api.getRestaurant().then((value) {
        setState(() {
          isLoaded = true;
        });
      });
    } catch (e) {
      _showToast(context);
    }
  }

  @override
  void initState() {
    super.initState();
    print("pro====================----------");
    if (from == null) {
      print("null");
      load();
      print("loaded");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (from == null) {
      if (isLoaded == true) {
        return FutureBuilder<RestaurantProfileModel>(
          future: api.getRestaurantFromSharedPref(),
          builder: (context, snapshot) {
            RestaurantProfileModel data = snapshot.data;
            return ProfileBody(
              snapshot: data,
            );
          },
        );
      } else {
        return FutureBuilder<RestaurantProfileModel>(
          future: api.getRestaurantFromSharedPref(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                RestaurantProfileModel data = snapshot.data;
                return ProfileBody(
                  snapshot: data,
                );
              }
            }
            return RestaurantProfileLoading();
          },
        );
      }
    } else {
      return FutureBuilder<RestaurantProfileModel>(
        future: api.getRestaurantWithId(from),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            RestaurantProfileModel data = snapshot.data;
            return ProfileBody(
              snapshot: data,
              from: from,
            );
          } else if (snapshot.hasError) {
            return RestaurantProfileLoading();
          }

          return RestaurantProfileLoading();
        },
      );
    }
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text("Couldn't refresh data"),
      ),
    );
  }
}
