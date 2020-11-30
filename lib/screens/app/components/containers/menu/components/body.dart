import 'package:flutter/material.dart';
import 'package:food_app/screens/app/components/containers/details/details-screen.dart';
import 'package:food_app/screens/app/components/containers/items/MenuItem/menu_item.dart';
import 'package:food_app/screens/app/components/models/item_lists_models.dart';
import 'package:masonry_grid/masonry_grid.dart';

// ignore: must_be_immutable
class MListBody extends StatelessWidget {
  List<MenuItemsListMd> itemLists;
  int id;
  MListBody({Key key, this.itemLists, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: MasonryGrid(
                column: 2,
                children: List.generate(itemLists.length, (index) {
                  MenuItemsListMd item = itemLists[index];
                  return MenuItemCard(
                    service: "Fast food",
                    restaurant: "MacDonalds",
                    title: item.title,
                    description: item.description,
                    price: item.price.toString(),
                    dsprice: item.dprice.toString(),
                    poster:
                        "https://i.pinimg.com/564x/1b/00/c3/1b00c30d63f572825a031497fc37c73c.jpg",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailsScreen(
                              list: item, id: id,
                            );
                          },
                        ),
                      );
                    },
                  );
                })))
      ],
    );
  }
}
