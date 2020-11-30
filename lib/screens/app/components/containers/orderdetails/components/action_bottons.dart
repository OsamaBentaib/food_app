import 'package:food_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/models/orders_model.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/services/orders_api_connection.dart';

// ignore: must_be_immutable
class UpdateByPerson extends StatelessWidget {
  Orders order;
  String status;
  UpdateByPerson({Key key, this.order, this.status}) : super(key: key);
  OrdersApiService _api = OrdersApiService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
              onTap: () {
                _api
                    .updateOrderByPerson(order.id, order.from.id, status)
                    .then((value) {
                  if (value) {
                    print("success");
                    Navigator.pop(context);
                  } else {
                    print("something wrong!");
                  }
                });
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: status=="CANCLED"?stColorCancel:status=="SUBMITED"?stColorConfirm:stColorCancel,
                ),
                child: Align(
                    child: Text(
                  status=="CANCLED"?"CANCEL":status=="SUBMITED"?"SUBMIT":"",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                )),
              ))),
    );
  }
}

// ignore: must_be_immutable
class CancelByRestaurant extends StatelessWidget {
  Orders order;
  CancelByRestaurant({Key key, this.order}) : super(key: key);
  OrdersApiService _api = OrdersApiService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
              onTap: () {
                _api
                    .updateOrder(order.id, order.by.id, "CANCLED")
                    .then((value) {
                  if (value) {
                    print("success");
                    Navigator.pop(context);
                  } else {
                    print("something wrong!");
                  }
                });
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: stColorCancel,
                ),
                child: Align(
                    child: Text(
                  "CANCEL",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                )),
              ))),
    );
  }
}

// ignore: must_be_immutable
class UpdateByRestaurant extends StatelessWidget {
  Orders order;
  String status;
  UpdateByRestaurant({Key key, this.order, this.status}) : super(key: key);
  OrdersApiService _api = OrdersApiService();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
                onTap: () {
                  _api.updateOrder(order.id, order.by.id, status).then((value) {
                    if (value) {
                      print("success");

                      Navigator.pop(context);
                    } else {
                      print("something wrong!");
                    }
                  });
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: stColorConfirm,
                  ),
                  child: Align(
                      child: Text(
                    order.status == "CONFIRMED"
                        ? "CONFIRM"
                        : order.status == "READY"
                            ? "READY"
                            : order.status == "DELIVERED"
                                ? "DELIVERY"
                                : order.status == "FINISHED" ? "FINISH" : "",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  )),
                ))));
  }
}
