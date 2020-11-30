import 'package:flutter/material.dart';
import 'package:food_app/screens/app/components/containers/orderdetails/components/body.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/models/orders_model.dart';

// ignore: must_be_immutable

class OrderDetailScreen extends StatelessWidget {
  final Orders order;
  final int ref;
  const OrderDetailScreen({Key key, this.order, this.ref}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "ORDER #${order.id}",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
        ),
      ),
      body: Body(
        order: order,
        ref: ref,
      ),
    );
  }
}
