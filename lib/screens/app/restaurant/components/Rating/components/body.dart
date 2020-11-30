import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/components/Animations/FadeAnimation.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double foodrating = 0;
  double dinInrating = 0;
  double takeawayrating = 0;
  double deliveryrating = 0;
  double finalrate = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
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
                                  "Rate Food",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                ),
                            ],),
                            Container(
                              padding: EdgeInsets.only(top:30),
                              child: SmoothStarRating(
                                borderColor: kPrimaryColor,
                                rating: 0,
                                size: 30,
                                onRated: (value) {
                                  foodrating = value;
                                  print("food rating value -> $foodrating");
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
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Rate Din-In",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                ),
                            ],),
                            Container(
                              padding: EdgeInsets.only(top:30),
                              child: SmoothStarRating(
                                borderColor: kPrimaryColor,
                                rating: 0,
                                size: 30,
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
                            border: Border(
                              top: BorderSide(width: 1, color: Colors.grey[200]),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Rate Takeaway",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                ),
                            ],),
                            Container(
                              padding: EdgeInsets.only(top:30),
                              child: SmoothStarRating(
                                borderColor: kPrimaryColor,
                                rating: 0,
                                size: 30,
                                onRated: (value) {
                                  takeawayrating = value;
                                  print("takeaway rating value -> $takeawayrating");
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
                              bottom: BorderSide(width: 1, color: Colors.grey[200]),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Rate Delivery",
                                  style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                                ),
                            ],),
                            Container(
                              padding: EdgeInsets.only(top:30),
                              child: SmoothStarRating(
                                borderColor: kPrimaryColor,
                                rating: 0,
                                size: 30,
                                onRated: (value) {
                                  deliveryrating = value;
                                  print("delivery rating value -> $deliveryrating");
                                  // print("rating value dd -> ${value.truncate()}");
                                },
                              ),
                            ),
                            ],
                          ),
                        ),
                        SizedBox(height: 120,)
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
              onTap: (){
                print("Rated food $foodrating DinIn $dinInrating takeaway $takeawayrating delivery $deliveryrating");
                finalrate = (foodrating + dinInrating + takeawayrating + deliveryrating )/4;
                print("final $finalrate");
              },
               child: Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FadeAnimation(2,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: kPrimaryColor
                      ),
                      child: Align(child: Text("Submit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),)),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
  }
}