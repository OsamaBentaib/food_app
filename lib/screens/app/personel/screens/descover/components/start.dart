import 'package:flutter/material.dart';
import 'package:food_app/screens/app/personel/screens/search/search_bar.dart';


class Start extends StatelessWidget {
  const Start({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    Text(
                      "What you're Looking For ?",
                      style: TextStyle(color: Colors.black87, fontSize: 25),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    
                    SizedBox(
                      height: 20,
                    ),
                    SaarchBTN(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ), 
                ),
          ]
      )     
    );
  }
}