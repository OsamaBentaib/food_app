import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class MenuItemCard extends StatelessWidget {
  final Function press;
  final String title, service, description, price, dsprice, poster, restaurant;
  final bool isOpen, isDelivery, isTakeaway, isDinIn, isNcDelivery, isPromoted;
  const MenuItemCard(
      {Key key,
      this.press,
      this.service,
      this.title,
      this.isDelivery,
      this.isDinIn,
      this.isNcDelivery,
      this.isOpen,
      this.isTakeaway,
      this.description,
      this.price,
      this.dsprice,
      this.poster,
      this.restaurant,
      this.isPromoted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: press,
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
                            left: BorderSide(width: 1, color: Colors.grey[200]),
                            top: BorderSide(width: 1, color: Colors.grey[200]),
                          ),
                          image: DecorationImage(
                              image: NetworkImage("$poster"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        title,
                        style: TextStyle(color: kTextColor, fontSize: 17),
                      ),
                      SizedBox(height: 6),
                      Text("Price \$$price"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
