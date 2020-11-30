import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class LoadingIntg extends StatelessWidget {
  const LoadingIntg({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          height: 120,
          width: 120,
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey[100]),
              right: BorderSide(width: 1, color: Colors.grey[100]),
              left: BorderSide(width: 1, color: Colors.grey[100]),
              top: BorderSide(width: 1, color: Colors.grey[100]),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                padding: EdgeInsets.all(14),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.13),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                height: 16,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
