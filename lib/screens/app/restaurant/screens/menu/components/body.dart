import 'package:flutter/material.dart';
import 'package:food_app/screens/app/components/containers/items/MenuItem/menu_item.dart';
import 'package:food_app/screens/app/components/containers/details/details-screen.dart';
class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MenuItemCard(
              service:"Fast food", 
              restaurant: "MacDonalds",
              title:"Big MacÂ®", 
              isDelivery:true, 
              isDinIn:true, 
              isNcDelivery:false, 
              isOpen:true,
              isTakeaway:true, 
              description:"Two 100% beef patties, a slice of cheese, lettuce, onion and pickles. And the sauce. That unbeatable, tasty Big MacÂ® sauce. You know you want to.", 
              price:"3.99", 
              dsprice:"1.99", 
              poster:"https://spanishsabores.com/wp-content/uploads/2013/05/IMG_8034.jpg",
              isPromoted: true,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailsScreen(
                        
                      );
                    },
                  ),
                );
              },
            ),
            MenuItemCard(
              service:"Fast food", 
              restaurant: "MacDonalds",
              title:"Big MacÂ®", 
              isDelivery:true, 
              isDinIn:true, 
              isNcDelivery:false, 
              isOpen:true,
              isTakeaway:true, 
              description:"Two 100% beef patties, a slice of cheese, lettuce, onion and pickles. And the sauce. That unbeatable, tasty Big MacÂ® sauce. You know you want to.", 
              price:"3.99", 
              dsprice:"1.99", 
              poster:"https://spanishsabores.com/wp-content/uploads/2013/05/IMG_8034.jpg",
            ),
            MenuItemCard(
              service:"Fast food", 
              restaurant: "MacDonalds",
              title:"Big MacÂ®", 
              isDelivery:true, 
              isDinIn:true, 
              isNcDelivery:false, 
              isOpen:true,
              isTakeaway:true, 
              description:"Two 100% beef patties, a slice of cheese, lettuce, onion and pickles. And the sauce. That unbeatable, tasty Big MacÂ® sauce. You know you want to.", 
              price:"3.99", 
              dsprice:"1.99", 
              poster:"https://spanishsabores.com/wp-content/uploads/2013/05/IMG_8034.jpg",
            ),
          ],
        ),
      ),
    );
  }
}