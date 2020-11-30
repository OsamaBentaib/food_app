import 'package:flutter/material.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/ref.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/profile_model.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/api_connection/api_connection.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/service_type.dart';

// ignore: must_be_immutable
class ServiceOfferEdit extends StatefulWidget {
  RestaurantProfileModel data;
  String ref;
  ServiceOfferEdit({Key key, this.data, this.ref}) : super(key: key);

  @override
  _ServiceOfferEditState createState() => _ServiceOfferEditState(data, ref);
}

class _ServiceOfferEditState extends State<ServiceOfferEdit> {
  SOApiService serviceApi = SOApiService();
  RestaurantProfileModel data;
  String ref;
  _ServiceOfferEditState(this.data, this.ref);
  bool isDelivery = false,
      isTakeaway = false,
      isDinIn = false,
      isNcDelivery = false,
      isUpdate = false,
      isLoading = false;

  @override
  void initState() {
    super.initState();
    if (data != null) {
      setState(() {
        isUpdate = true;
        isDelivery = data.serviceOffer.isDelivery;
        isTakeaway = data.serviceOffer.isTakeaway;
        isDinIn = data.serviceOffer.isDinIn;
        isNcDelivery = data.serviceOffer.isNcDelivery;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Service Offer"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              InkWell(
                hoverColor: Colors.grey[200],
                onTap: () {
                  setState(() {
                    if (isTakeaway) {
                      isTakeaway = false;
                    } else if (!isTakeaway) {
                      isTakeaway = true;
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: ListTile(
                    leading: isTakeaway
                        ? Virefied()
                        : Virefied(
                            np: true,
                          ),
                    title: Text(
                      "Takeaway",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Dot(),
                              Container(
                                width: 190,
                                child: Text(
                                  "Please add this service only if your restaurant offers takeaway service",
                                  style: TextStyle(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                hoverColor: Colors.grey[200],
                onTap: () {
                  setState(() {
                    if (isDinIn) {
                      isDinIn = false;
                    } else if (!isDinIn) {
                      isDinIn = true;
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: ListTile(
                    leading: isDinIn
                        ? Virefied()
                        : Virefied(
                            np: true,
                          ),
                    title: Text(
                      "Din-In",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Dot(),
                              Container(
                                width: 190,
                                child: Text(
                                  "Please add this service only if your restaurant offers Din-In service",
                                  style: TextStyle(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                hoverColor: Colors.grey[200],
                onTap: () {
                  setState(() {
                    if (isDelivery) {
                      isDelivery = false;
                    } else if (!isDelivery) {
                      isDelivery = true;
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: ListTile(
                    leading: isDelivery
                        ? Virefied()
                        : Virefied(
                            np: true,
                          ),
                    title: Text(
                      "Delivery",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Dot(),
                              Container(
                                width: 190,
                                child: Text(
                                  "Please add delivery service only if your restaurant offering delivery with your own stuff",
                                  style: TextStyle(),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Dot(),
                              Container(
                                width: 190,
                                child: Text(
                                  "Please notice that we are not delivery service.",
                                  style: TextStyle(),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Dot(),
                              Container(
                                width: 190,
                                child: Text(
                                  "Will Will help you to emprove your delivery services with new costumers",
                                  style: TextStyle(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                hoverColor: Colors.grey[200],
                onTap: () {
                  setState(() {
                    if (isNcDelivery) {
                      isNcDelivery = false;
                    } else if (!isNcDelivery) {
                      isNcDelivery = true;
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: ListTile(
                    leading: isNcDelivery
                        ? Virefied()
                        : Virefied(
                            np: true,
                          ),
                    title: Text(
                      "No-Contact Delivery",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Dot(),
                              Container(
                                width: 190,
                                child: Text(
                                  "The others delivery services can delivery orders to your custumers",
                                  style: TextStyle(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      if (!isLoading) {
                        setState(() {
                          isLoading = true;
                        });
                        if (data == null) {
                          serviceApi
                              .createServiceOffer(
                                  isDinIn, isTakeaway, isDelivery, isNcDelivery)
                              .then((value) {
                            if (value) {
                              setState(() {
                                isLoading = false;
                              });
                              if (ref == null) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ServiceType(),
                                  ),
                                );
                              } else if (ref == "home") {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MyStatefulWidget(
                                      ref: 1,
                                    ),
                                  ),
                                );
                              }
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          });
                        } else {
                          serviceApi
                              .updateServiceOffer(
                                  isDinIn, isTakeaway, isDelivery, isNcDelivery)
                              .then((value) {
                            if (value) {
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.pop(context);
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          });
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          isUpdate
                              ? isLoading ? "Please wait.." : "UPDATE"
                              : isLoading ? "Please wait.." : "CREATE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
