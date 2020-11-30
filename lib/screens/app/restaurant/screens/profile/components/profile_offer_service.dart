import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/components/icons.dart';

class OfferServices extends StatelessWidget {
  final bool dineIn, takeaway, delevery, ncdelevery;
  const OfferServices({Key key, this.delevery, this.dineIn, this.ncdelevery, this.takeaway}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
             Container(child: dineIn == true ? Check() : X(),),
             Container(child:Text(textDinin,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: kTextLightColor),),),
             Container(child: Dot(),),
             Container(child: takeaway == true ? Check() : X(),),
             Container(child:Text(textTakeaway,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: kTextLightColor),),),
             Container(child: Dot(),),
             Container(child:delevery == true ? Check(): ncdelevery == true? Check(): X(),),
             Container(child:Text(delevery == true ? textdelevery: ncDelevery,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: kTextLightColor),),),
             
            ],),
    );
  }
}