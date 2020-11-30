import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/screens/home/components/lists/Restaurant_lists.dart';
import 'package:food_app/screens/app/personel/screens/home/components/lists/loading.dart';
import 'package:food_app/screens/app/personel/screens/home/components/services/api_connection.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/profile_model.dart';

class DininList extends StatelessWidget {
  final String city;
  const DininList({Key key, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Dinin in $city",
            style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 180,
            child: ItemsLists(
              city: city,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemsLists extends StatefulWidget {
  final String city;
  ItemsLists({this.city});

  @override
  _ItemsListsState createState() => _ItemsListsState(city);
}

class _ItemsListsState extends State<ItemsLists> {
  APIConnect api = APIConnect();
  final String city;
  _ItemsListsState(this.city);

  bool isLoaded = false;
  load() async {
    try {
      await api.getDininItemLists(city).then((value) {
        setState(() {
          isLoaded = true;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return FutureBuilder<List<RestaurantProfileModel>>(
        future: api.getDininItemListsFromSharedPref(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Container(
                  child: RestaurantItemsLists(items: snapshot.data),
                )
              : RILoading();
        },
      );
    } else {
      return FutureBuilder<List<RestaurantProfileModel>>(
        future: api.getDininItemListsFromSharedPref(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return RILoading();
          }
          return snapshot.hasData
              ? Container(
                  child: RestaurantItemsLists(items: snapshot.data),
                )
              : RILoading();
        },
      );
    }
  }
}
