import 'package:flutter/material.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/screens/app/personel/components/models/person_models.dart';
import 'package:food_app/screens/app/components/containers/menu/menu_screen.dart';
import 'package:food_app/screens/app/personel/screens/home/components/widgets/discount_card.dart';
import 'package:food_app/screens/app/personel/screens/home/components/widgets/popular.dart';
import 'package:food_app/screens/app/personel/screens/home/components/widgets/Delivery.dart';
import 'package:food_app/screens/app/personel/screens/home/components/widgets/score.dart';
import 'package:food_app/screens/app/personel/screens/home/components/widgets/promo.dart';
import 'package:food_app/screens/app/personel/screens/home/components/widgets/takeaway.dart';
import 'package:food_app/screens/app/personel/screens/home/components/widgets/dinin.dart';
import 'package:food_app/screens/app/personel/screens/home/components/widgets/verified.dart';
import 'package:food_app/screens/app/personel/screens/home/components/widgets/open.dart';
// import 'package:food_app/screens/app/home/components/slider.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  PersonModel person;
  Body({this.person});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Start(),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
            padding: EdgeInsets.only(top: 10),
            child: DiscountCard(),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
            padding: EdgeInsets.only(top: 10),
            child: PopularList(
              city: person.city != null ? person.city : "",
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
            padding: EdgeInsets.only(top: 10),
            child: PromoList(
              city: person.city,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
            padding: EdgeInsets.only(top: 10),
            child: ScoreList(
              city: person.city,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
            padding: EdgeInsets.only(top: 10),
            child: OpenList(
              city: person.city,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
            padding: EdgeInsets.only(top: 10),
            child: TakeawayList(
              city: person.city,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
            padding: EdgeInsets.only(top: 10),
            child: DininList(
              city: person.city,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
            padding: EdgeInsets.only(top: 10),
            child: DeliveryList(
              city: person.city,
            ),
          ),
          Container(
              child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MenuScreenLists(id: 1);
                      },
                    ),
                  );
                },
                child: Text("Press"),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

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
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Find order from any',
                  style: TextStyle(color: Colors.black87, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Restaurant',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                LogoDotEats(),
               
                // SizedBox(
                //   height: 20,
                // ),
                // Container(
                //   padding: EdgeInsets.all(5),
                //   decoration: BoxDecoration(
                //       color: Color.fromRGBO(244, 243, 243, 1),
                //       borderRadius: BorderRadius.circular(15)),
                //   child: TextField(
                //     decoration: InputDecoration(
                //         border: InputBorder.none,
                //         prefixIcon: Icon(
                //           Icons.search,
                //           color: Colors.black87,
                //         ),
                //         hintText: "Search for food",
                //         hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ]));
  }
}
