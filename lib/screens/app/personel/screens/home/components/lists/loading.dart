import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class RILoading extends StatelessWidget {
  const RILoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          width: 230,
          height: 200,
          margin: EdgeInsets.only(right: 10),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey[200]),
                      right: BorderSide(width: 1, color: Colors.grey[200]),
                      left: BorderSide(width: 1, color: Colors.grey[200]),
                      top: BorderSide(width: 1, color: Colors.grey[200]),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          padding: EdgeInsets.all(14),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.13),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 20,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 20,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
