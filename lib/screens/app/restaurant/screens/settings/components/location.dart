import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/ref.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/profile_model.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/api_connection/api_connection.dart';
import 'package:geolocator/geolocator.dart';

class RestaurantLocationEdit extends StatefulWidget {
  RestaurantProfileModel data;

  RestaurantLocationEdit({
    this.data,
  });
  @override
  _RestaurantLocationEditState createState() =>
      _RestaurantLocationEditState(data);
}

class _RestaurantLocationEditState extends State<RestaurantLocationEdit> {
  RestaurantProfileModel data;
  String ref;
  _RestaurantLocationEditState(this.data);
  Position _currentPosition;
  LocationApi api = LocationApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          if (data == null)
            Container(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  final create = <String, String>{
                    "long": "0.000000",
                    "lat": "-0.000000"
                  };
                  api.createLocation(create).then((value) {
                    if (value) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => MyStatefulWidget(
                                ref: 1,
                              )));
                    } else {
                      print("something wrong");
                    }
                  });
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentPosition != null)
              Text(
                  "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                _getCurrentLocation();
              },
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              // it will cover 80% of total width
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    final create = <String, String>{
                      "long": "0.000000",
                      "lat": "-0.000000"
                    };
                    if (data != null) {
                      api.updateLocation(create).then((value) {
                        if (value) {
                          Navigator.pop(context);
                        } else {
                          print("something wrong");
                        }
                      });
                    } else {
                      api.createLocation(create).then((value) {
                        if (value) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyStatefulWidget(
                                        ref: 1,
                                      )));
                        } else {
                          print("something wrong");
                        }
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data == null
                              ? "Next".toUpperCase()
                              : "Update".toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    print("position.latitude");
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      print("position.latitude");
      print(position.latitude);
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print("position.latitude wrror");
      print(e);
    });
  }
}
