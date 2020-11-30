import 'dart:math';

import 'package:flutter/material.dart';

import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/screens/settings/components/edit_city.dart';
import 'package:food_app/screens/app/personel/screens/settings/services/services.dart';
import 'package:food_app/screens/app/personel/components/models/person_models.dart';

// ignore: must_be_immutable
class PersonEditPhone extends StatefulWidget {
  PersonModel profile;
  int id;
  PersonEditPhone({Key key, this.profile, this.id}) : super(key: key);

  @override
  _PersonEditPhoneState createState() => _PersonEditPhoneState(profile, id);
}

class _PersonEditPhoneState extends State<PersonEditPhone> {
  PersonModel profile;
  int id;
  _PersonEditPhoneState(this.profile, this.id);

  bool _isLoading = false;
  APIProfile _apiService = APIProfile();
  bool _isFieldphoneValid;
  TextEditingController _controllerPhone = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("---pro----");
    print(profile);
    if (profile != null) {
      print("Not Null");
      _isFieldphoneValid = true;
      _controllerPhone.text = profile.phone.phone;
    }
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
                text: profile == null ? "Add Phone" : "Update Phone",
                style: TextStyle(color: kTextColor),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(15),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 11),
                                  Container(
                                    padding: EdgeInsets.only(left: 12),
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(244, 243, 243, 1),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: TextField(
                                      controller: _controllerPhone,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Phone",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        errorText: _isFieldphoneValid == null ||
                                                _isFieldphoneValid
                                            ? null
                                            : "Phone is required",
                                      ),
                                      onChanged: (value) {
                                        bool isFieldValid =
                                            value.trim().isNotEmpty;
                                        if (isFieldValid !=
                                            _isFieldphoneValid) {
                                          setState(() => _isFieldphoneValid =
                                              isFieldValid);
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    // padding: EdgeInsets.all(20),
                                    width: double.infinity,
                                    // it will cover 80% of total width
                                    decoration: BoxDecoration(
                                      color: _isLoading
                                          ? kPrimaryColor.withOpacity(.4)
                                          : kPrimaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          if (_isFieldphoneValid == null ||
                                              !_isFieldphoneValid) {}
                                          /*    */
                                          setState(() => _isLoading = true);
                                          /*  */
                                          String phone =
                                              _controllerPhone.text.toString();

                                          final data = <String, String>{
                                            "phone": phone,
                                          };
                                          int min =
                                              100000; //min and max values act as your 6 digit range
                                          int max = 999999;
                                          var randomizer = new Random();
                                          var code = min +
                                              randomizer.nextInt(max - min);
                                          if (profile == null) {
                                            print("___is___");
                                            final create = <String, String>{
                                              "long": "0.000000",
                                              "lat": "-0.000000"
                                            };
                                            _apiService
                                                .createLocation(create)
                                                .then((value) {});

                                            _apiService
                                                .cratePhone(data, code)
                                                .then((isSuccess) {
                                              print(isSuccess);
                                              setState(
                                                  () => _isLoading = false);
                                              if (isSuccess) {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                VerifyCode(
                                                                  code: code,
                                                                  id: id,
                                                                )));
                                              } else {
                                                print(
                                                    'Somthing wont wrong Please try again later');
                                              }
                                            });
                                          } else {
                                            print("___Not___");
                                            _apiService
                                                .updatePhone(data)
                                                .then((isSuccess) {
                                              print(isSuccess);
                                              setState(
                                                  () => _isLoading = false);
                                              if (isSuccess) {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                VerifyCode(
                                                                  code: code,
                                                                  profile:
                                                                      profile,
                                                                  id: id,
                                                                )));
                                              } else {
                                                print(
                                                    'Somthing wont wrong Please try again later');
                                              }
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                profile == null
                                                    ? !_isLoading
                                                        ? "Next".toUpperCase()
                                                        : "Please wait..."
                                                            .toUpperCase()
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
                            )),
                        SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class VerifyCode extends StatefulWidget {
  PersonModel profile;
  int id, code;
  VerifyCode({Key key, this.profile, this.id, this.code}) : super(key: key);

  @override
  _VerifyCodeState createState() => _VerifyCodeState(profile, id, code);
}

class _VerifyCodeState extends State<VerifyCode> {
  PersonModel profile;
  int id, code;
  _VerifyCodeState(this.profile, this.id, this.code);

  bool _isLoading = false;
  APIProfile _apiService = APIProfile();
  bool _isFieldphoneValid;
  TextEditingController _controllerPhone = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("---pro----");
    print(profile);
    if (profile != null) {}
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
                text: "Verify Phone",
                style: TextStyle(color: kTextColor),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(15),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 11),
                                  Text("$code"),
                                  Container(
                                    padding: EdgeInsets.only(left: 12),
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(244, 243, 243, 1),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: TextField(
                                      controller: _controllerPhone,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Code",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        errorText: _isFieldphoneValid == null ||
                                                _isFieldphoneValid
                                            ? null
                                            : "Code is required",
                                      ),
                                      onChanged: (value) {
                                        bool isFieldValid =
                                            value.trim().isNotEmpty;
                                        if (isFieldValid !=
                                            _isFieldphoneValid) {
                                          setState(() => _isFieldphoneValid =
                                              isFieldValid);
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    // padding: EdgeInsets.all(20),
                                    width: double.infinity,
                                    // it will cover 80% of total width
                                    decoration: BoxDecoration(
                                      color: _isLoading
                                          ? kPrimaryColor.withOpacity(.4)
                                          : kPrimaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() => _isLoading = true);
                                          /*  */
                                          String incode =
                                              _controllerPhone.text.toString();
                                          if (int.parse(incode) == code) {
                                            final data = <String, bool>{
                                              "isActivate": true,
                                            };

                                            print("___is___");

                                            _apiService
                                                .updatePhone(data)
                                                .then((isSuccess) {
                                              print(isSuccess);
                                              setState(
                                                  () => _isLoading = false);
                                              if (isSuccess) {
                                                if (profile == null) {
                                                  Navigator.of(context).pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              PersonCitiesEdit(
                                                                register: true,
                                                                id: id,
                                                              )));
                                                } else {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                }
                                              } else {
                                                print(
                                                    'Somthing wont wrong Please try again later');
                                              }
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                profile == null
                                                    ? !_isLoading
                                                        ? "Verify".toUpperCase()
                                                        : "Please wait..."
                                                            .toUpperCase()
                                                    : "Verify".toUpperCase(),
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
                            )),
                        SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
