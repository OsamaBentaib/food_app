import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/screens/app/components/containers/menu/menu_screen.dart';

// import 'package:food_app/screens/app/reviews/reviews.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/components/profile_top.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/components/profile_reviews.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/components/profile_service_details.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/components/profile_bio.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/components/profile_address.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/components/profile_contact.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/components/profile_offer_service.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/components/profile_rating.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/profile_model.dart';

// ignore: must_be_immutable
class ProfileBody extends StatelessWidget {
  RestaurantProfileModel snapshot;
  int from;
  ProfileBody({Key key, this.snapshot, this.from}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bkcolor,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 180,
                backgroundColor: bkcolor,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: ProfileTop(
                    imagepic:
                        "https://www.cityguiderotterdam.com/fileadmin/_processed_/6/d/csm_prachtig-rotterdam-FB_7ed70336a3.jpg",
                    title: snapshot.name != null ? snapshot.name : "",
                    isVirefied: snapshot.isVerified ? true : false,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: ProfileServiceDetails(
                            service: snapshot.service != null
                                ? snapshot.service
                                : "",
                            score: snapshot.score,
                            city: snapshot.city != null ? snapshot.city : "",
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Bio(
                                  bio:
                                      snapshot.bio != null ? snapshot.bio : ""),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Address(
                                address: snapshot.address != null
                                    ? snapshot.address
                                    : "",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Contact(
                                website: snapshot.website != null
                                    ? snapshot.website
                                    : "",
                                phone: snapshot.phone != null
                                    ? snapshot.phone
                                    : "",
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: OfferServices(
                            dineIn:
                                snapshot.serviceOffer.isDinIn ? true : false,
                            takeaway:
                                snapshot.serviceOffer.isTakeaway ? true : false,
                            delevery:
                                snapshot.serviceOffer.isDelivery ? true : false,
                            ncdelevery: snapshot.serviceOffer.isNcDelivery
                                ? true
                                : false,
                          ),
                        ),
                        from != null
                            ? InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MenuScreenLists(
                                        id: snapshot.id,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                    width: double.infinity,
                                    padding:
                                        EdgeInsets.fromLTRB(20, 13, 20, 13),
                                    decoration: BoxDecoration(
                                      color: bkcolor,
                                      border: Border(
                                        top: BorderSide(
                                            width: 1, color: Colors.grey[200]),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Menu",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kTextColor),
                                        ),
                                        ChRigth(),
                                      ],
                                    )),
                              )
                            : Container(),
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
