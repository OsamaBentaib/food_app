import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/screens/app/personel/components/data/sharedPref.dart';
import 'package:food_app/screens/app/personel/screens/settings/components/edit_city.dart';

import 'package:food_app/screens/app/personel/screens/settings/components/edit_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/screens/app/personel/screens/settings/components/phone.dart';
import 'package:food_app/screens/auth/bloc/authentication_bloc.dart';
import 'package:food_app/screens/app/personel/components/models/person_models.dart';
import 'package:food_app/screens/auth/login/login_page.dart';
import 'package:food_app/screens/auth/repository/user_repository.dart';

final userRepository = UserRepository();
SharedPupularItems sharedPrefPupularItems = SharedPupularItems();
SharedPrefOrders sharedPreforders = SharedPrefOrders();

class Body extends StatefulWidget {
  final PersonModel person;
  const Body({Key key, this.person}) : super(key: key);

  @override
  _BodyState createState() => _BodyState(person);
}

class _BodyState extends State<Body> {
  final PersonModel person;
  _BodyState(this.person);
  bool isLogginout = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                    return PersonEditProfile(
                      profile: widget.person,
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
                    return PersonCitiesEdit(
                      id: widget.person.id,
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
                          "City & Country",
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
                    return PersonEditPhone(profile: widget.person);
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
                          "Phone",
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
              "About & FeedBack",
              style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
            ),
          ),
          GestureDetector(
            onTap: () {},
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
                          "About us",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kTextColor),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {},
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
                          "Contact us",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kTextColor),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {},
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
                          "Privary Policy",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kTextColor),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {},
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
                          "I Need Help",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kTextColor),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Are you sure want to Logout "),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            sharedPrefPupularItems.remove("Person_data");
                            print("removed");
                            sharedPreforders.remove("orders");
                            sharedPrefPupularItems.remove("PopularItems");
                            BlocProvider.of<AuthenticationBloc>(context)
                                .add(LoggedOut());
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginPage(
                                            userRepository: userRepository)));
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text("Logout"),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        )
                      ],
                    );
                  });
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
