import 'package:flutter/material.dart';
import 'package:food_app/components/icons.dart';

class ProfileTop extends StatelessWidget {
  final String imagepic, title;
  final bool isVirefied;
  const ProfileTop({Key key, this.imagepic, this.isVirefied, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("$imagepic"), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [Colors.black, Colors.black.withOpacity(0.0000001)])),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(width: 4),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: isVirefied == true ? Virefied() : SizedBox(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
