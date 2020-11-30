import 'package:flutter/material.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/screens/app/components/containers/orderdetails/components/order_summary.dart';
import 'package:food_app/screens/app/components/containers/orderdetails/components/order_info.dart';
import 'package:food_app/screens/app/components/containers/orderdetails/components/action_bottons.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/components/containers/orderdetails/rating_control/rate_ckeck.dart';
import 'package:food_app/screens/app/components/models/item_lists_models.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/models/orders_model.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  Orders order;
  int ref;
  Body({Key key, this.order, this.ref}) : super(key: key);

  @override
  _BodyState createState() => _BodyState(order, ref);
}

class _BodyState extends State<Body> {
  Orders order;
  int ref;
  _BodyState(this.order, this.ref);
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double amount = 0;
    widget.order.item.forEach((e) {
      amount += double.parse(e.orderitem.price);
    });
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                          child: Text(
                            "ITEMS (${widget.order.item.length})",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: kTextColor,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 15),
                        order.item.length > 0
                            ? Container(
                                height: 210,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.order.item.length,
                                    itemBuilder: (context, index) {
                                      final itemIt = order.item;
                                      Item item = itemIt[index];
                                      return Container(
                                        padding: EdgeInsets.all(6),
                                        margin: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              width: 120,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[50],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border(
                                                    bottom: BorderSide(
                                                        width: 1,
                                                        color:
                                                            Colors.grey[200]),
                                                    right: BorderSide(
                                                        width: 1,
                                                        color:
                                                            Colors.grey[200]),
                                                    left: BorderSide(
                                                        width: 1,
                                                        color:
                                                            Colors.grey[200]),
                                                    top: BorderSide(
                                                        width: 1,
                                                        color:
                                                            Colors.grey[200]),
                                                  )),
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              item.orderitem.title,
                                              style: TextStyle(
                                                  color: kTextColor,
                                                  fontSize: 17),
                                            ),
                                            Text(
                                                "Price \$${item.orderitem.price}"),
                                            Text("Quantity ${item.quantity}"),
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            : Container(),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: OrderInfo(
                            orderBy: widget.order.by.name,
                            orderService: widget.order.type,
                            orderStatue: widget.order.status,
                            orderTime: widget.order.time,
                            phone: widget.order.by.phone.phone != null
                                ? widget.order.by.phone.phone
                                : "",
                          ),
                        ),
                        widget.ref == 1
                            ? Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      contact,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor),
                                    ),
                                    order.type == "DELIVERY"
                                        ? Container(
                                            margin: EdgeInsets.fromLTRB(
                                                5, 10, 10, 0),
                                            padding: EdgeInsets.all(5),
                                            child: Row(children: <Widget>[
                                              Cursor(),
                                              SizedBox(width: 10),
                                              Text(
                                                "See The location",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: kTextLightColor),
                                              ),
                                            ]),
                                          )
                                        : Container(),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                      padding: EdgeInsets.all(5),
                                      child: Row(children: <Widget>[
                                        Tele(),
                                        SizedBox(width: 10),
                                        Text(
                                          order.by.phone.phone,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kTextLightColor),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: OrderSummary(
                            total: amount.toStringAsFixed(2),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: widget.ref == 1
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                      if (order.status != "CREATED" ||
                                          order.status != "FINISHED")
                                        CancelByRestaurant(order: order),
                                      if (order.status == "CREATED" ||
                                          order.status == "FINISHED")
                                        Container(
                                          height: 50,
                                          width: 150,
                                        ),
                                    ])
                              : widget.ref == 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                          if (order.status == "CREATED")
                                            UpdateByPerson(
                                                order: order,
                                                status: "CANCLED"),
                                          if (order.status == "CREATED" &&
                                              order.item.length > 0)
                                            UpdateByPerson(
                                                order: order,
                                                status: "SUBMITED"),
                                        ])
                                  : Container(),
                        ),
                        if (order.status != "CREATED")
                          Container(
                            padding: EdgeInsets.all(6),
                            child: Text(
                              "Notice",
                              style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          child: order.item.length == 0
                              ? Text(
                                  "You can't submit this order becouse there's no orders on it",
                                  style: TextStyle(fontWeight: FontWeight.w300))
                              : order.status == "CREATED"
                                  ? Text(
                                      "You need to submit your order to send this order to ${order.from.name}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    )
                                  : order.status == "SUBMITED"
                                      ? Text(
                                          "` Your order has benn submited we are waiting the confirmation `",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300),
                                        )
                                      : order.status == "CONFIRMED"
                                          ? Text(
                                              "Your Order is confirmed Wait it to be ready soon",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          : order.status == "READY"
                                              ? Text(
                                                  "Your Order is Ready Now",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300),
                                                )
                                              : order.status == "FINISHED"
                                                  ? Text(
                                                      "Your Order is successed and finished, congratulations",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    )
                                                  : order.status == "CANCLED"
                                                      ? Text(
                                                          "Your Order has Been Cancled for some reason, please make sure that not going to happen again or you wount be able to order again",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        )
                                                      : Text(""),
                        ),
                        SizedBox(
                          height: 120,
                        ),
                        isLoading
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
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
}
