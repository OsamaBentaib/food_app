import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/components/models/person_models.dart';
import 'package:food_app/screens/app/personel/screens/settings/services/services.dart';
import 'package:food_app/screens/app/ref.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/api_connection/api_connection.dart';
import 'package:geolocator/geolocator.dart';

class CL {
  Future<Position> getCurrentLocation() async {
    try {
      print("a");
      Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
      print("a");
      Position position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      print(position);
      print("a");
      return position;
    } catch (err) {
      print("b");
      print(err.message);
    }
    return null;
  }
}

class PersonLocationEdit extends StatefulWidget {
  PersonModel data;

  PersonLocationEdit({
    this.data,
  });
  @override
  _PersonLocationEditState createState() => _PersonLocationEditState(data);
}

class _PersonLocationEditState extends State<PersonLocationEdit> {
  PersonModel data;
  String ref;
  _PersonLocationEditState(this.data);
  Position _currentPosition;
  APIProfile api = APIProfile();
  CL con = CL();
  _position() async {
    print("Locatopn");
    await con.getCurrentLocation().then((value) {
      setState(() {
        _currentPosition = value;
        print(_currentPosition.latitude);
        print(_currentPosition.longitude);
      });
    });
  }

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
              padding: EdgeInsets.all(7),
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
                    color: kTextColor,
                    fontSize: 16,
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
                _position();
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
                      "long": "${_currentPosition.longitude}",
                      "lat": "${_currentPosition.latitude}"
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
                                        ref: 0,
                                      )));
                        } else {
                          print("something wrong");
                        }
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
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
}
