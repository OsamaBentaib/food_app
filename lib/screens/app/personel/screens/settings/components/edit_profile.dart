import 'package:flutter/material.dart';

import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/screens/settings/components/phone.dart';
import 'package:food_app/screens/app/personel/screens/settings/services/services.dart';
import 'package:food_app/screens/app/personel/components/models/person_models.dart';

// ignore: must_be_immutable
class PersonEditProfile extends StatefulWidget {
  PersonModel profile;
  PersonEditProfile({Key key, this.profile}) : super(key: key);

  @override
  _PersonEditProfileState createState() => _PersonEditProfileState(profile);
}

class _PersonEditProfileState extends State<PersonEditProfile> {
  PersonModel profile;
  _PersonEditProfileState(this.profile);

  bool _isLoading = false;
  APIProfile _apiService = APIProfile();
  bool _isFieldNameValid;
  TextEditingController _controllerName = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("---pro----");
    print(profile);
    if (profile != null) {
      print("Not Null");
      _isFieldNameValid = true;
      _controllerName.text = profile.name;
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
                text: profile == null ? "Create Profile" : "Update Profile",
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
                                      controller: _controllerName,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Full Name",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        errorText: _isFieldNameValid == null ||
                                                _isFieldNameValid
                                            ? null
                                            : "Name is required",
                                      ),
                                      onChanged: (value) {
                                        bool isFieldValid =
                                            value.trim().isNotEmpty;
                                        if (isFieldValid != _isFieldNameValid) {
                                          setState(() =>
                                              _isFieldNameValid = isFieldValid);
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    width: double.infinity,
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
                                          if (_isFieldNameValid == null ||
                                              !_isFieldNameValid) {}
                                          /*    */
                                          setState(() => _isLoading = true);
                                          /*  */
                                          String name =
                                              _controllerName.text.toString();
                                          PersonModel person = PersonModel(
                                              name: name,
                                              address: "",
                                              city: "",
                                              country: "");
                                          if (profile == null) {
                                            print("___is___");
                                            _apiService
                                                .createPersoneAccount(person)
                                                .then((isSuccess) {
                                              print("sucssess");
                                              print(isSuccess);
                                              setState(
                                                  () => _isLoading = false);
                                              if (isSuccess != null) {
                                                Navigator.of(context).pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            PersonEditPhone(
                                                                id: isSuccess)));
                                              } else {
                                                print(
                                                    'Somthing wont wrong Please try again later');
                                              }
                                            });
                                          } else {
                                            final up = <String, String>{
                                              "name": name
                                            };
                                            _apiService
                                                .updatePersoneAccount(
                                                    up, profile.id)
                                                .then((isSuccess) {
                                              print(isSuccess);
                                              setState(
                                                  () => _isLoading = false);
                                              if (isSuccess) {
                                                Navigator.pop(context);
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
                                                    : !_isLoading
                                                        ? "UPDATE".toUpperCase()
                                                        : "Please wait..."
                                                            .toUpperCase(),
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
