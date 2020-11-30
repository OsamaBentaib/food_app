import 'package:flutter/material.dart';
import 'package:food_app/screens/app/personel/screens/home/components/cards/Restaurant_card.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/profile_model.dart';

class RestaurantItemsLists extends StatelessWidget {
  final List<RestaurantProfileModel> items;
  const RestaurantItemsLists({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          RestaurantProfileModel item = items[index];
          return RestaurantCard(item: item);
        });
  }
}
