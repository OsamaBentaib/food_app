import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class RestaurantProfileLoading extends StatefulWidget {
  RestaurantProfileLoading({
    Key key,
  }) : super(key: key);

  @override
  _RestaurantProfileLoadingState createState() =>
      _RestaurantProfileLoadingState();
}

class _RestaurantProfileLoadingState extends State<RestaurantProfileLoading> {
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
                backgroundColor: Colors.grey[50],
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
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
                            child: Row(
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
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 20,
                                    width: 170,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[100]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    height: 16,
                                    width: 170,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[100]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 20,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 20,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100]),
                              ),
                              Container(
                                height: 20,
                                margin: EdgeInsets.only(top: 5),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 20,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100]),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                height: 20,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100]),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 20,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100]),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                height: 20,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100]),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                height: 20,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100]),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                height: 20,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[100]),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[100]),
                                ),
                                Container(
                                  height: 20,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[100]),
                                ),
                                Container(
                                  height: 20,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[100]),
                                ),
                              ],
                            )),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                              color: bkcolor,
                              border: Border(
                                top: BorderSide(
                                    width: 1, color: Colors.grey[200]),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  width: 100,
                                  margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[100]),
                                ),
                                Container(
                                  height: 20,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[100]),
                                ),
                                Container(
                                  height: 20,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[100]),
                                ),
                                Container(
                                  height: 20,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[100]),
                                ),
                              ],
                            )),
                        InkWell(
                          child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
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
                                  Container(
                                    height: 20,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[100]),
                                  ),
                                ],
                              )),
                        ),
                        InkWell(
                          child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
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
                                  Container(
                                    height: 20,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[100]),
                                  ),
                                ],
                              )),
                        ),
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
