import 'package:flutter/material.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/constants.dart';

class OrderItems extends StatelessWidget {
  final int orderid;
  final Function press;
  final String orderService,
      orderTime,
      orderStatue,
      orderBy,
      orderAmount,
      orderDate;
  final String status;
  const OrderItems(
      {Key key,
      this.orderAmount,
      this.orderBy,
      this.orderDate,
      this.orderService,
      this.orderStatue,
      this.orderTime,
      this.orderid,
      this.status,
      this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: Color(0xFFB0CCE1).withOpacity(0.27),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "ORDER NO: ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                  Container(
                    child: Text(
                      "#$orderid",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: kTextColor,
                          fontSize: 18),
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
                      "SERVICE : ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
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
            orderTime != null
                ? Container(
                    padding: EdgeInsets.all(7),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "TIME COMING : ",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
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
                  )
                : Container(),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "STATUE : ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: status == "CREATED"
                          ? Colors.indigo[100]
                          : status == "SUBMITED"
                              ? Colors.blue[200]
                              : status == "CONFIRMED"
                                  ? stColorConfirm
                                  : status == "READY"
                                      ? stColorReady
                                      : status == "FINISHED"
                                          ? kPrimaryColor
                                          : status == "DELIVERED"
                                              ? Colors.purpleAccent[100]
                                              : status == "CANCLED"
                                                  ? stColorCancel
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
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
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
                      "ORDER AMOUNT : ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                  Container(
                    child: Text(
                      "$orderAmount",
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
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
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
      ),
    );
  }
}
