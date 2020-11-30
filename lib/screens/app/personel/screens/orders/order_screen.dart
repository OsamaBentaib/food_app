import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/screens/orders/components/body.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({Key key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Body(),
    );
  }
}