import 'package:flutter/material.dart';
import 'package:food_app/screens/app/components/containers/menu/components/body.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/components/containers/menu/components/menu_loading.dart';
import 'package:food_app/screens/app/components/models/item_lists_models.dart';
import 'package:food_app/screens/app/components/service/menu_items_api_connection.dart';
import 'package:masonry_grid/masonry_grid.dart';

// ignore: must_be_immutable
class MenuScreenLists extends StatefulWidget {
  int id;
  MenuScreenLists({Key key, this.id}) : super(key: key);

  @override
  _MenuScreenListsState createState() => _MenuScreenListsState(id);
}

class _MenuScreenListsState extends State<MenuScreenLists> {
  MenuListsApiService apiService = MenuListsApiService();
  int id;
  _MenuScreenListsState(this.id);
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    print("id------>  ");
    print(id);
    if (id == null)
      apiService.getRestaurantMenuLists().then((value) {
        print("____-----____----");
        if (value == 200) {
          print("Loaded------------");
          setState(() {
            isLoaded = true;
          });
        } else if (value == 404) {
          print("Loaded------------404");
          setState(() {
            isLoaded = true;
          });
        } else {}
      });
  }

  @override
  Widget build(BuildContext context) {
    if (id == null) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: RichText(
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  // ignore: deprecated_member_use
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: "Menu",
                  style: TextStyle(color: kTextColor),
                ),
              ],
            ),
          ),
        ),
        body: isLoaded
            ? FutureBuilder(
                future: apiService.getMenuFromSharedPref(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<MenuItemsListMd>> snapshot) {
                  if (snapshot.data.length > 0) {
                    List<MenuItemsListMd> itemLists = snapshot.data;
                    return MListBody(
                      itemLists: itemLists,
                    );
                  } else {
                    return Center(
                      child: Text("There's No Orders Yet"),
                    );
                  }
                },
              )
            : FutureBuilder(
                future: apiService.getMenuFromSharedPref(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<MenuItemsListMd>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length > 0) {
                        List<MenuItemsListMd> itemLists = snapshot.data;
                        return MListBody(
                          itemLists: itemLists,
                        );
                      } else {
                        return Center(
                          child: Text("There's No Orders Yet"),
                        );
                      }
                    }
                  }
                  return Scaffold(
                      backgroundColor: Colors.grey[100],
                      body: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                              child: MasonryGrid(
                                  column: 2,
                                  children: List.generate(
                                    10,
                                    (i) => MenuLoading(),
                                  )))
                        ],
                      ));
                },
              ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: RichText(
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  // ignore: deprecated_member_use
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: "Menu",
                  style: TextStyle(color: kTextColor),
                ),
              ],
            ),
          ),
        ),
        body: FutureBuilder(
          future: apiService.getRestaurantMenuListsWithId(widget.id),
          builder: (BuildContext context,
              AsyncSnapshot<List<MenuItemsListMd>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<MenuItemsListMd> itemLists = snapshot.data;

                return MListBody(itemLists: itemLists, id: id);
              } else {
                return Center(
                  child: Text("Ooops Somthing wont wrong"),
                );
              }
            } else {
              return Scaffold(
                  backgroundColor: Colors.grey[100],
                  body: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                          child: MasonryGrid(
                              column: 2,
                              children: List.generate(
                                10,
                                (i) => MenuLoading(),
                              )))
                    ],
                  ));
            }
          },
        ),
      );
    }
  }
}
