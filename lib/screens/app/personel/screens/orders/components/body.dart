import 'package:flutter/material.dart';
import 'package:food_app/screens/app/components/containers/orderdetails/order_details.dart';
import 'package:food_app/screens/app/components/containers/orderitem/order_items.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/components/orders_loading.dart';
import 'package:food_app/screens/app/personel/screens/orders/connection/api_connection.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/models/orders_model.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  APIOrders apiService = APIOrders();
  bool isLoaded = false;
  load() async {
    try {
      apiService.getOrdersUserLists().then((value) {
        setState(() {
          isLoaded = true;
        });
      });
    } catch (e) {
      _showToast(context);
    }
  }

  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return Container(
        child: FutureBuilder(
          future: apiService.getOrdersUserFromSharedPref(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Orders>> snapshot) {
            if (snapshot.hasData) {
              List<Orders> ordersLists = snapshot.data;
              if (ordersLists.length > 0) {
                return ListView(
                  children: ordersLists
                      .map(
                        (Orders order) => OrdersItemList(
                          order: order,
                        ),
                      )
                      .toList(),
                );
              } else {
                return Center(
                  child: Text("There's no orders"),
                );
              }
            }
            return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  OrdersLoading(),
                  OrdersLoading(),
                  OrdersLoading(),
                  OrdersLoading(),
                  OrdersLoading(),
                  OrdersLoading(),
                ]));
          },
        ),
      );
    } else {
      return Container(
        child: FutureBuilder(
          future: apiService.getOrdersUserFromSharedPref(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Orders>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<Orders> ordersLists = snapshot.data;
                if (ordersLists.length > 0) {
                  return ListView(
                    children: ordersLists
                        .map(
                          (Orders order) => OrdersItemList(
                            order: order,
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Center(
                    child: Text("There's no orders"),
                  );
                }
              }
            }
            return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  OrdersLoading(),
                  OrdersLoading(),
                  OrdersLoading(),
                  OrdersLoading(),
                  OrdersLoading(),
                  OrdersLoading(),
                ]));
          },
        ),
      );
    }
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text("Couldn't refresh data"),
      ),
    );
  }
}

// ignore: must_be_immutable
class OrdersItemList extends StatelessWidget {
  Orders order;
  OrdersItemList({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double amount = 0;
    order.item.forEach((e) {
      amount += double.parse(e.orderitem.price);
    });

    return Container(
      child: OrderItems(
        status: order.status,
        orderid: order.id,
        orderAmount: amount.toStringAsFixed(2),
        orderBy: order.by.name != null ? order.by.name : "",
        orderService: order.type != null ? order.type : "",
        orderStatue: order.status == "CREATED"
            ? "AWATING SUBMITION"
            : order.status == "SUBMITED"
                ? "AWATING CONFIRMATION"
                : order.status == "CONFIRMED"
                    ? "BEING READY SOON"
                    : order.status == "READY"
                        ? order.type == "DELIVERY" ? "DELIVERING" : "READY"
                        : order.status == "FINISHED"
                            ? "FINISHED"
                            : order.status == "DELIVERED"
                                ? "DELIVERED"
                                : order.status == "CANCLED" ? "CANCLED" : "",
        orderTime: order.type != "DELIVERY"
            ? order.time != null ? order.time : null
            : null,
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return OrderDetailScreen(
                  order: order,
                  ref: 0,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
