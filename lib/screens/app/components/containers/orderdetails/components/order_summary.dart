import 'package:food_app/constants.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final String total;
  const OrderSummary({Key key, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "ORDER SUMMARY",
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: kTextColor, fontSize: 17),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  "Total",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: kTextColor,
                      fontSize: 17),
                ),
              ),
              Container(
                child: Text(
                  "$total $priceSuffix",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: kTextColor,
                      fontSize: 17),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
