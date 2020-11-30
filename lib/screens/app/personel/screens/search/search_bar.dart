import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/components/containers/details/details-screen.dart';
import 'package:food_app/screens/app/components/containers/items/MenuItem/menu_item.dart';


class SaarchBTN extends StatelessWidget {
  const SaarchBTN({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color.fromRGBO(244, 243, 243, 1),
            borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: (){
            showSearch(context: context, delegate: DataSearch(), query: "Osama",);
          },
          child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black87,
                            ),
                            hintText: "Search for food & reataurants, categories",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final suggests = [
    "Osama",
    "bentaib",
    "Arina",
    "Love",
  ];
  final recentSeggests = [
    "Osama",
    "Arina"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {

    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, null);
      }, 
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        ),
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SingleChildScrollView(child:Results(query: query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentSeggests:suggests.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index)=>
        ListTile(
          onTap: (){
            showResults(context);
          },
          title: RichText(text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: kTextLightColor,)
              ),
            ]
          )),
        ),
      );
  }

}

class Results extends StatelessWidget {
  final String query;
  const Results({Key key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
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
      ],),
    );
  }
}