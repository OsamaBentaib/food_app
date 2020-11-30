import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
class Items extends StatelessWidget {
  final String imgsrc, title;
  final int quantity;
  final double price;
  const Items({Key key, @required this.title, @required this.imgsrc, @required this.price, @required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top:10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey[200]),
                ),
            ),
            child: ListTile(
              leading: Container(
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10)),
                child: Image(
                  width: 60,
                  height: 140,
                  fit: BoxFit.cover,
                    image: NetworkImage("$imgsrc")),
              ),
              title: Text("$title", style: TextStyle(fontWeight: FontWeight.w600,  fontSize:15),),
              subtitle: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(6),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text("QUANTITY :", style: TextStyle(fontWeight: FontWeight.w600,  fontSize: 15),),
                          ),
                          Container(
                            child: Text(" $quantity", style: TextStyle(fontWeight: FontWeight.w900, color: kTextColor, fontSize: 15),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text("PRICE :", style: TextStyle(fontWeight: FontWeight.w600,  fontSize: 15),),
                          ),
                          Container(
                            child: Text(" $price", style: TextStyle(fontWeight: FontWeight.w900, color: kTextColor, fontSize: 15),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}