import 'package:flutter/material.dart';
import 'package:food_app/screens/app/components/containers/orderdetails/order_details.dart';
import 'package:food_app/screens/app/components/containers/orderitem/order_items.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/components/orders_loading.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/models/orders_model.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/services/orders_api_connection.dart';

// ignore: must_be_immutable
class OrdersBody extends StatefulWidget {
  final String s;
  OrdersBody({Key key, this.s}) : super(key: key);

  @override
  _OrdersBodyState createState() => _OrdersBodyState(s);
}

class _OrdersBodyState extends State<OrdersBody> {
  String p = "all";
  String s;
  _OrdersBodyState(this.s);

  OrdersApiService apiService = OrdersApiService();
  bool isLoaded = false;
  void initState() {
    super.initState();
    apiService.getOrdersLists(p, widget.s, 0, 10).then((value) => setState(() {
          isLoaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return Container(
        child: FutureBuilder(
          future: apiService.getOrdersFromSharedPref(s),
          builder:
              (BuildContext context, AsyncSnapshot<List<Orders>> snapshot) {
            if (snapshot.hasData && snapshot.data.length > 0) {
              List<Orders> ordersLists = snapshot.data;
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
                child: Text("There's no orders here"),
              );
            }
          },
        ),
      );
    } else {
      return Container(
        child: FutureBuilder(
          future: apiService.getOrdersFromSharedPref(s),
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
                    child: Text("There's no orders here"),
                  );
                }
              } else {
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
              }
            } else {
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
            }
          },
        ),
      );
    }
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
                  ref: 1,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
