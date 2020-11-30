import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/components/icons.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Reviews extends StatefulWidget {
  Reviews({Key key}) : super(key: key);

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10),
       child: Container(
       padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey[200]),
            right: BorderSide(width: 1, color: Colors.grey[200]),
            left: BorderSide(width: 1, color: Colors.grey[200]),
            top: BorderSide(width: 1, color: Colors.grey[200]),
          ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(children: <Widget>[
              SmoothStarRating(
                borderColor: kPrimaryColor,
                rating: 4,
                size: 15,
                // onRatingChanged: onRatingChanged,
              ),
              Container(child: Dot(),),
              Text(
                "4.0",
                style: TextStyle(
                    fontSize: 14,
                    color: kTextColor, fontWeight: FontWeight.w600),
              ),
            ],)
          ),
          Text("Excellent experience!!! We have tried several dishes from the menu and all of them were amazing. The dishes are served in a way that allows to share them, what we found as a big plus. The dessert with popping sugar was fantastic, at the moment I tried it I remembered my childhood :) The service in the restaurant was excellent.", 
            style: TextStyle(color: Colors.grey, height: 1.4),),
            SizedBox(height: 10,),
        ],
      ),
     )
    );
  }
}