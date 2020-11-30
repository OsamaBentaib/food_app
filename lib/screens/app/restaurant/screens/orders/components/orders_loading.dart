import 'package:flutter/material.dart';

class OrdersLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                    height: 20,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 20,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 20,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 20,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 20,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 20,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 20,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 20,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[100]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
