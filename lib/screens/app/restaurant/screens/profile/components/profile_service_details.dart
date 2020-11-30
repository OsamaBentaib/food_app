import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:food_app/components/icons.dart';

class ProfileServiceDetails extends StatelessWidget {
  final String city, service;
  final int score;
  const ProfileServiceDetails({Key key, this.city, this.score, this.service})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
            padding: EdgeInsets.all(14),
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.13),
              shape: BoxShape.circle,
            ),
            child: Shop()),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Geo(),
                      SizedBox(width: 5),
                      Text(
                        city,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: kTextColor),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          service,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: kTextLightColor),
                        ),
                      ),
                      score > 0
                          ? Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Dot(),
                                  ),
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: Text(
                                      "$score",
                                      style: TextStyle(
                                        color: kTextColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: Text(
                                      "Points",
                                      style: TextStyle(
                                        color: kTextLightColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
