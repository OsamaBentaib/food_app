import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/restaurant/local/models/restaurant_model.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/profile_model.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/api_connection/api_connection.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/city_edit.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/models/api_models.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

// ignore: must_be_immutable
class RestaurantEditProfile extends StatefulWidget {
  RestaurantProfileModel profile;
  RestaurantEditProfile({Key key, this.profile}) : super(key: key);

  @override
  _RestaurantEditProfileState createState() =>
      _RestaurantEditProfileState(profile);
}

class _RestaurantEditProfileState extends State<RestaurantEditProfile> {
  RestaurantProfileModel profile;
  _RestaurantEditProfileState(this.profile);
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  bool _isLoading = false;
  ApiService _apiService = ApiService();
  bool _isFieldNameValid;
  bool _isFieldAddressValid;
  bool _isFieldPhoneValid;
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerAddress = TextEditingController();
  TextEditingController _controllerBio = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerWebsite = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (profile != null) {
      _isFieldNameValid = true;
      _controllerName.text = profile.name;
      _isFieldAddressValid = true;
      _controllerAddress.text = profile.address;
      _isFieldPhoneValid = true;
      _controllerPhone.text = profile.phone;
      _controllerBio.text = profile.bio;
      _controllerWebsite.text = profile.website;
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
              SliverAppBar(
                expandedHeight: 180,
                backgroundColor: Colors.grey[200],
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                      image: _image != null
                          ? DecorationImage(
                              image: FileImage(_image), fit: BoxFit.cover)
                          : null,
                    ),
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: getImage,
                              child: Container(
                                width: 60,
                                height: 40,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Camera(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                                        hintText: "Restaurant name",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        errorText: _isFieldNameValid == null ||
                                                _isFieldNameValid
                                            ? null
                                            : "Title is required",
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
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(244, 243, 243, 1),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: TextField(
                                      controller: _controllerBio,
                                      minLines: 3,
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                        filled: true,
                                        border: InputBorder.none,
                                        hintText: "About your Restaurant",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(244, 243, 243, 1),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: TextField(
                                      controller: _controllerAddress,
                                      minLines: 3,
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                        filled: true,
                                        border: InputBorder.none,
                                        hintText: "Address",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        errorText:
                                            _isFieldAddressValid == null ||
                                                    _isFieldAddressValid
                                                ? null
                                                : "Address is required",
                                      ),
                                      onChanged: (value) {
                                        bool isFieldValid =
                                            value.trim().isNotEmpty;
                                        if (isFieldValid !=
                                            _isFieldAddressValid) {
                                          setState(() => _isFieldAddressValid =
                                              isFieldValid);
                                        }
                                      },
                                    ),
                                  ),
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
                                        errorText: _isFieldPhoneValid == null ||
                                                _isFieldPhoneValid
                                            ? null
                                            : "Phone is required",
                                      ),
                                      onChanged: (value) {
                                        bool isFieldValid =
                                            value.trim().isNotEmpty;
                                        if (isFieldValid !=
                                            _isFieldPhoneValid) {
                                          setState(() => _isFieldPhoneValid =
                                              isFieldValid);
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    padding: EdgeInsets.only(left: 12),
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(244, 243, 243, 1),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: TextField(
                                      controller: _controllerWebsite,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Website",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    // padding: EdgeInsets.all(20),
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
                                          if (_isFieldNameValid == null ||
                                              _isFieldPhoneValid == null ||
                                              _isFieldAddressValid == null ||
                                              !_isFieldNameValid ||
                                              !_isFieldAddressValid ||
                                              !_isFieldPhoneValid) {
                                            _scaffoldState.currentState
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Please fill all field"),
                                              ),
                                            );
                                            return;
                                          }
                                          /*    */
                                          setState(() => _isLoading = true);
                                          /*  */
                                          String name =
                                              _controllerName.text.toString();
                                          String phone =
                                              _controllerPhone.text.toString();
                                          String website = _controllerWebsite
                                              .text
                                              .toString();
                                          String address = _controllerAddress
                                              .text
                                              .toString();
                                          String bio =
                                              _controllerBio.text.toString();

                                          Restaurant restaurant = Restaurant(
                                            name: name,
                                            address: address,
                                            phone: phone,
                                            bio: bio,
                                            website: website,
                                            categorie: "",
                                            location: "",
                                            avatar: "",
                                          );
                                          print("Okkkkk");
                                          if (profile == null) {
                                            print("___is___");
                                            _apiService
                                                .createRestaurant(restaurant)
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
                                                        RestaurantCitiesEdit(
                                                      register: true,
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                print(
                                                    'Somthing wont wrong Please try again later');
                                              }
                                            });
                                          } else {
                                            print("___Not___");
                                            _apiService
                                                .updateRestaurant(restaurant)
                                                .then(
                                              (isSuccess) {
                                                print(isSuccess);
                                                setState(
                                                    () => _isLoading = false);
                                                if (isSuccess) {
                                                  Navigator.pop(context);
                                                } else {
                                                  print(
                                                      'Somthing wont wrong Please try again later');
                                                }
                                              },
                                            );
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
                                                    ? _isLoading
                                                        ? "Please wait.."
                                                            .toUpperCase()
                                                        : "Next".toUpperCase()
                                                    : _isLoading
                                                        ? "Please wait.."
                                                            .toUpperCase()
                                                        : "Update"
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
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  // Future<void> persistRestaurant({@required RestaurantForDB restaurant}) async {
  //   // write token with the user to the database
  //   final create =
  //       await RestaurantDatabaseProvider.db.addrestaurantToDatabase(restaurant);
  //   print(create);
  //   print("seccess adding to database");
  // }

  // Future<void> updateDBRestaurant(
  //     {@required RestaurantForDB restaurant}) async {
  //   // write token with the user to the database
  //   final update =
  //       await RestaurantDatabaseProvider.db.addrestaurantToDatabase(restaurant);
  //   print(update);
  //   print("seccess Update the database");
  // }
}
