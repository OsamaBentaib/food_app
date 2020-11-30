import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/components/icons.dart';

class OrderInfo extends StatelessWidget {
  final String orderService, orderTime, orderStatue, orderBy, orderDate, phone;
  final bool isSubmited, isConfermed, isReady, isCanceled, isFinish;
  const OrderInfo(
      {Key key,
      this.orderBy,
      this.orderDate,
      this.orderService,
      this.orderStatue,
      this.orderTime,
      this.isCanceled,
      this.isConfermed,
      this.isFinish,
      this.isReady,
      this.isSubmited,
      this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(7),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "SERVICE : ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    "$orderService",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kTextColor,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(7),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "TIME COMING : ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    "$orderTime",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kTextColor,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(7),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "STATUE : ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: isConfermed == true
                        ? Colors.green[200]
                        : isReady == true
                            ? Colors.black54
                            : isCanceled == true
                                ? Colors.red[200]
                                : isFinish == true
                                    ? kPrimaryColor
                                    : Colors.blue[200],
                  ),
                  child: Text(
                    "$orderStatue",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(7),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "FROM : ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    "$orderBy",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kTextColor,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(7),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "PHONE : ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    "$phone",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kTextColor,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(7),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "DATE : ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                Text("Monday 28 Mai"),
                Dot(),
                Text("18:20 PM"),
                Dot(),
                Text("3 Min"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
