import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/profile_model.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/api_connection/api_connection.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/city_edit.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/edit_profile.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/service_offer.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/service_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/screens/auth/bloc/authentication_bloc.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  RestaurantProfileModel data;
  Body({Key key, this.data}) : super(key: key);

  @override
  _BodyState createState() => _BodyState(data);
}

class _BodyState extends State<Body> {
  bool status = false;
  RestaurantProfileModel data;
  String sttxt = "Close";
  _BodyState(this.data);
  ApiService api_ = ApiService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data != null) {
      status = widget.data.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
              decoration: BoxDecoration(
                color: bkcolor,
                border: Border(
                  top: BorderSide(width: 1, color: Colors.grey[200]),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Set Statue ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kTextColor),
                            ),
                            Text(
                              "( " + sttxt + " )",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: status == true
                                      ? kPrimaryColor
                                      : stColorCancel),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        activeColor: kPrimaryColor,
                        value: status,
                        onChanged: (value) {
                          setState(() {
                            status = value;
                            print(status);
                            if (status == true) {
                              sttxt = "Open";
                            } else {
                              sttxt = "Close";
                            }
                          });
                          final up = <String, bool>{"status": status};
                          api_.updateRestaurant(up).then((value) {
                            print(value);
                            print("updated");
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your Restaurant is Currently " +
                        sttxt +
                        " make sure to set that every work time ",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: kTextLightColor),
                  ),
                ],
              )),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey[200]),
              ),
            ),
            child: Text(
              "Account",
              style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RestaurantEditProfile(
                      profile: data,
                    );
                  },
                ),
              );
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
                decoration: BoxDecoration(
                  color: bkcolor,
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey[200]),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kTextColor),
                        ),
                        ChRigth(),
                      ],
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RestaurantCitiesEdit();
                  },
                ),
              );
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
                decoration: BoxDecoration(
                  color: bkcolor,
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey[200]),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "City & Country",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kTextColor),
                        ),
                        ChRigth(),
                      ],
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ServiceType();
                  },
                ),
              );
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
                decoration: BoxDecoration(
                  color: bkcolor,
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey[200]),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Restaurant Type",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kTextColor),
                        ),
                        ChRigth(),
                      ],
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ServiceOfferEdit(
                      data: widget.data,
                    );
                  },
                ),
              );
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
                decoration: BoxDecoration(
                  color: bkcolor,
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey[200]),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Service Offer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kTextColor),
                        ),
                        ChRigth(),
                      ],
                    ),
                  ],
                )),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey[200]),
              ),
            ),
            child: Text(
              "Privacy",
              style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
            ),
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
              decoration: BoxDecoration(
                color: bkcolor,
                border: Border(
                  top: BorderSide(width: 1, color: Colors.grey[200]),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Upgrade to premium",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kTextColor),
                      ),
                      ChRigth(),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your Restaurant is Currently infree mode, upgrade your account to access more futures.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: kTextLightColor),
                  ),
                ],
              )),
          Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
              decoration: BoxDecoration(
                color: bkcolor,
                border: Border(
                  top: BorderSide(width: 1, color: Colors.grey[200]),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Request Verification",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kTextColor),
                      ),
                      ChRigth(),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "This Future is Only Aviable for Premium account",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: kTextLightColor),
                  ),
                ],
              )),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey[200]),
              ),
            ),
            child: Text(
              "About Us",
              style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
            ),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
                decoration: BoxDecoration(
                  color: bkcolor,
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.grey[200]),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Logout",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: stColorCancel),
                        ),
                        LogoutBox(),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
