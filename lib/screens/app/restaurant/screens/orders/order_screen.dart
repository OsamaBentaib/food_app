import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/components/orders_body.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({Key key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
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
                  text: "Orders",
                  style: TextStyle(color: kTextColor),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(45),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey[200]),
                  ),
                ),
                height: 40,
                padding: EdgeInsets.only(bottom: 10),
                child: TabBar(
                    isScrollable: true,
                    indicatorColor: kPrimaryColor,
                    unselectedLabelColor: kPrimaryColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: TextStyle(fontSize: 12, color: Colors.white),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor),
                    tabs: [
                      Tab(
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(color: kPrimaryColor, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "ALL",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(color: kPrimaryColor, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "CONFIRMED",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(color: kPrimaryColor, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "READY",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(color: kPrimaryColor, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "DELIVERED",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(color: kPrimaryColor, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "FINISHED",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(color: kPrimaryColor, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "CANCLED",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ]),
              )),
        ),
        body: TabBarView(
          children: [
            OrdersBody(s:"all"),
            OrdersBody(s:"CONFIRMED"),
            OrdersBody(s:"READY"),
            OrdersBody(s:"DELIVERED"),
            OrdersBody(s:"FINISHED"),
            OrdersBody(s:"CANCLED"),
          ],
        ),
      ),
    );
  }
}
