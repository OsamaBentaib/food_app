import 'package:flutter/material.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/profile_model.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/restaurant_profile.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantProfileModel item;
  const RestaurantCard({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RestaurantProfile(
                from: item.id,
              ),
            ),
          );
        },
        child: Container(
          width: 230,
          margin: EdgeInsets.only(right: 10),
          child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey[200]),
                        right: BorderSide(width: 1, color: Colors.grey[200]),
                        left: BorderSide(width: 1, color: Colors.grey[200]),
                        top: BorderSide(width: 1, color: Colors.grey[200]),
                      )),
                ),
                item.status
                    ? Positioned(
                        bottom: 8,
                        left: 8,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.green[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            "OPEN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 10),
                          ),
                        ),
                      )
                    : Container(),
                item.score > 0
                    ? Positioned(
                        right: 8,
                        bottom: 8,
                        child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              children: <Widget>[
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
                                    "${item.score}",
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )
                    : Container(),
              ]),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            padding: EdgeInsets.all(14),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.13),
                              shape: BoxShape.circle,
                            ),
                            child: Shop()),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 20,
                              width: double.infinity,
                              child: Text(
                                item.name != null ? item.name : "",
                                style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                item.service != null ? item.service : "",
                                style: TextStyle(
                                  color: kTextLightColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
