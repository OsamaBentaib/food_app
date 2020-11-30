import 'package:flutter/material.dart';

class MenuLoading extends StatelessWidget {
  const MenuLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(6),
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey[200]),
                              right:
                                  BorderSide(width: 1, color: Colors.grey[200]),
                              left:
                                  BorderSide(width: 1, color: Colors.grey[200]),
                              top:
                                  BorderSide(width: 1, color: Colors.grey[200]),
                            )),
                      ),
                      SizedBox(height: 6),
                      Container(
                        margin: EdgeInsets.only(right: 0),
                        padding: EdgeInsets.only(right: 20),
                        width: double.infinity,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        margin: EdgeInsets.only(right: 0),
                        padding: EdgeInsets.only(right: 10),
                        width: double.infinity,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        margin: EdgeInsets.only(right: 0),
                        padding: EdgeInsets.only(right: 10),
                        width: double.infinity,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
