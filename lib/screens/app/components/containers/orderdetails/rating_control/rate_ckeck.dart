import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/components/containers/orderdetails/rating_control/api_connection.dart';
import 'package:food_app/screens/app/components/containers/orderdetails/rating_control/rate_models.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

// ignore: must_be_immutable
class RateCheck extends StatefulWidget {
  int rstid;
  String service;
  RateCheck({Key key, this.rstid, this.service}) : super(key: key);

  @override
  _RateCheckState createState() => _RateCheckState(rstid, service);
}

class _RateCheckState extends State<RateCheck> {
  int rstid;
  String service;
  _RateCheckState(this.rstid, this.service);
  APIRateingControl api = APIRateingControl();
  bool isUpdate;
  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("rate"),
      ),
      body: FutureBuilder<Ratemodels>(
        future: api.arteCkeck(rstid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Ratemodels data = snapshot.data;
              return _buildrateView(data, service, rstid);
            } else {
              return _buildrateView(null, service, rstid);
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _buildrateView(Ratemodels data, String service, int rstid) {
    double dinInrating;
    double takeawayrating;
    double deliveryrating;
    return Container(
        child: Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        decoration: BoxDecoration(
                          color: bkcolor,
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Rate Din-In",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: kTextColor),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: SmoothStarRating(
                                borderColor: kPrimaryColor,
                                rating: data != null ? data.dinInrate : 0,
                                size: 50,
                                onRated: (value) {
                                  dinInrating = value;
                                  print("dinIn rating value -> $dinInrating");
                                  // print("rating value dd -> ${value.truncate()}");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        decoration: BoxDecoration(
                          color: bkcolor,
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Rate Takeaway",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: kTextColor),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: SmoothStarRating(
                                borderColor: kPrimaryColor,
                                rating: data != null ? data.takeawayrate : 0,
                                size: 50,
                                onRated: (value) {
                                  takeawayrating = value;
                                  print(
                                      "takeaway rating value -> $takeawayrating");
                                  // print("rating value dd -> ${value.truncate()}");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        decoration: BoxDecoration(
                          color: bkcolor,
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.grey[200]),
                            bottom:
                                BorderSide(width: 1, color: Colors.grey[200]),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Rate Delivery",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: kTextColor),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: SmoothStarRating(
                                borderColor: kPrimaryColor,
                                rating: data != null ? data.deliveryrate : 0,
                                size: 50,
                                onRated: (value) {
                                  deliveryrating = value;
                                  print(
                                      "delivery rating value -> $deliveryrating");
                                  // print("rating value dd -> ${value.truncate()}");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 120,
                      )
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
        Positioned.fill(
          bottom: 50,
          child: GestureDetector(
            onTap: () {
              if (data == null) {
                double finalrate =
                    (dinInrating + takeawayrating + deliveryrating) / 3;
                double rate = double.parse(finalrate.toStringAsFixed(2));
                print("final $rate");
                api
                    .createRate(rstid, rate, dinInrating, takeawayrating,
                        deliveryrating)
                    .then((response) {
                  print(response);
                  if (response == 201) {
                    Navigator.pop(context);
                  } else {
                    print("something wrong");
                  }
                });
              } else {}
            },
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kPrimaryColor),
                  child: Align(
                      child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  )),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
