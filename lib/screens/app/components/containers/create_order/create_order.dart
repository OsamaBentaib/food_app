import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/components/containers/create_order/api_connection.dart';
import 'package:food_app/screens/app/components/containers/items/MenuItem/menu_item.dart';
import 'package:food_app/screens/app/components/containers/menu/components/menu_loading.dart';
import 'package:food_app/screens/app/components/models/item_lists_models.dart';
import 'package:food_app/screens/app/components/service/menu_items_api_connection.dart';
import 'package:food_app/screens/app/personel/components/models/person_models.dart';
import 'package:food_app/screens/app/personel/components/services/api_connection.dart';
import 'package:food_app/screens/app/personel/screens/settings/services/services.dart';
import 'package:masonry_grid/masonry_grid.dart';

// ignore: must_be_immutable
class StartOrder extends StatefulWidget {
  MenuItemsListMd itemList;
  StartOrder({Key key, this.itemList}) : super(key: key);

  @override
  _StartOrderState createState() => _StartOrderState(itemList);
}

class _StartOrderState extends State<StartOrder> {
  MenuItemsListMd itemList;
  _StartOrderState(this.itemList);
  bool delivery = false, dinin = false, takeaway = false;
  @override
  Widget build(BuildContext context) {
    print("dinin $dinin");
    print("takeaway $takeaway");
    print("delivery $delivery");
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("New Order"),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (takeaway || dinin) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PickTimeSet(
                            ordertype:
                                takeaway ? "TAKEAWAY" : dinin ? "DININ" : "",
                            itemList: itemList);
                      },
                    ),
                  );
                } else if (delivery) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OrderDelivery(
                          item: itemList,
                        );
                      },
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10),
                    Text(
                      "Next",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              itemList.rstid.sof.isDelivery == true
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          delivery = true;
                          dinin = false;
                          takeaway = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: ListTile(
                          leading: delivery
                              ? Virefied()
                              : Virefied(
                                  np: true,
                                ),
                          title: Text(
                            "Delivery",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Dot(),
                                    Container(
                                      width: 130,
                                      child: Text(
                                        "The restaurant will delivery this order for you we are not responsple for delivery",
                                        style: TextStyle(),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 15,
              ),
              itemList.rstid.sof.isDinIn == true
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          delivery = false;
                          dinin = true;
                          takeaway = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: ListTile(
                          leading: dinin
                              ? Virefied()
                              : Virefied(
                                  np: true,
                                ),
                          title: Text(
                            "Din-in",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Dot(),
                                    Container(
                                      width: 130,
                                      child: Text(
                                        "You have to set time to come to the restaurant",
                                        style: TextStyle(),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 15,
              ),
              itemList.rstid.sof.isTakeaway == true
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          takeaway = true;
                          delivery = false;
                          dinin = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: ListTile(
                          leading: takeaway
                              ? Virefied()
                              : Virefied(
                                  np: true,
                                ),
                          title: Text(
                            "Takeaway",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Dot(),
                                    Container(
                                      width: 130,
                                      child: Text(
                                        "You have to set time to come to the restaurant",
                                        style: TextStyle(),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PickTimeSet extends StatefulWidget {
  MenuItemsListMd itemList;
  String ordertype;
  PickTimeSet({Key key, this.itemList, this.ordertype}) : super(key: key);

  @override
  _PickTimeSetState createState() => _PickTimeSetState(itemList, ordertype);
}

class _PickTimeSetState extends State<PickTimeSet> {
  MenuItemsListMd itemList;
  String ordertype;
  _PickTimeSetState(this.itemList, this.ordertype);
  CreateOrderAPI api = CreateOrderAPI();
  int _selected;
  String _time;
  int _orderId;

  @override
  Widget build(BuildContext context) {
    print(_time);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Order Time"),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Material(
            child: InkWell(
              onTap: () {
                if (_time != null &&
                    ordertype != "" &&
                    ordertype != null &&
                    itemList.rstid.id != null) {
                  print(ordertype);
                  print(_time);
                  print(itemList.rstid.id);
                  api
                      .crateOrder(ordertype, _time, itemList.rstid.id)
                      .then((value) {
                    if (value.id != null) {
                      setState(() {
                        _orderId = value.id;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ItemsListAddorders(
                                id: itemList.rstid.id, order: _orderId);
                          },
                        ),
                      );
                    }
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10),
                    Text(
                      "Next",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: MasonryGrid(
                      column: 3,
                      children: List.generate(
                        23,
                        (i) {
                          int count = (i + 1) * 5;
                          String time;
                          if (i < 11) {
                            time = "min";
                          }
                          if (i > 10) {
                            int hour = i - 10;
                            String hor = "hours";
                            if (hour == 1) hor = "hour";
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selected = i;
                                  _time = "$hour $hor";
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.all(4),
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white,
                                      border: _selected == i
                                          ? Border(
                                              bottom: BorderSide(
                                                  width: 2,
                                                  color: kPrimaryColor),
                                              right: BorderSide(
                                                  width: 2,
                                                  color: kPrimaryColor),
                                              left: BorderSide(
                                                  width: 2,
                                                  color: kPrimaryColor),
                                              top: BorderSide(
                                                  width: 2,
                                                  color: kPrimaryColor),
                                            )
                                          : null),
                                  child: Center(
                                    child: Text("$hour $hor"),
                                  )),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selected = i;
                                  _time = "$count $time";
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.all(4),
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white,
                                      border: _selected == i
                                          ? Border(
                                              bottom: BorderSide(
                                                  width: 2,
                                                  color: kPrimaryColor),
                                              right: BorderSide(
                                                  width: 2,
                                                  color: kPrimaryColor),
                                              left: BorderSide(
                                                  width: 2,
                                                  color: kPrimaryColor),
                                              top: BorderSide(
                                                  width: 2,
                                                  color: kPrimaryColor),
                                            )
                                          : null),
                                  child: Center(
                                    child: Text("$count $time"),
                                  )),
                            );
                          }
                        },
                      )))
            ],
          )),
    );
  }
}

// ignore: must_be_immutable
class ItemsListAddorders extends StatefulWidget {
  int id, order;
  ItemsListAddorders({Key key, this.id, this.order}) : super(key: key);

  @override
  _ItemsListAddordersState createState() => _ItemsListAddordersState(id, order);
}

class _ItemsListAddordersState extends State<ItemsListAddorders> {
  int id, order;
  _ItemsListAddordersState(this.id, this.order);
  MenuListsApiService apiService = MenuListsApiService();
  CreateOrderAPI api = CreateOrderAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Add to cart"),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Material(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10),
                    Text(
                      "Finish",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: apiService.getRestaurantMenuListsWithId(id),
        builder: (BuildContext context,
            AsyncSnapshot<List<MenuItemsListMd>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<MenuItemsListMd> itemLists = snapshot.data;
              return _buildListView(itemLists);
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

  Widget _buildListView(List<MenuItemsListMd> itemLists) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: MasonryGrid(
                column: 2,
                children: List.generate(itemLists.length, (index) {
                  MenuItemsListMd item = itemLists[index];

                  return Column(
                    children: <Widget>[
                      MenuItemCard(
                        title: item.title,
                        description: item.description,
                        price: item.price.toString(),
                        dsprice: item.dprice.toString(),
                        poster:
                            "https://i.pinimg.com/564x/1b/00/c3/1b00c30d63f572825a031497fc37c73c.jpg",
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          TextEditingController _controller =
                                              TextEditingController();
                                          _controller.text = "1";
                                          return AlertDialog(
                                            title: Container(
                                              width: double.infinity,
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      height: 30,
                                                      margin: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[50],
                                                      ),
                                                      child: TextFormField(
                                                        textAlign:
                                                            TextAlign.center,
                                                        controller: _controller,
                                                        keyboardType: TextInputType
                                                            .numberWithOptions(
                                                          decimal: false,
                                                          signed: true,
                                                        ),
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          WhitelistingTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text("Yes"),
                                                onPressed: () {
                                                  int quantity = int.parse(
                                                      _controller.text
                                                          .toString());
                                                  print(quantity);
                                                  api
                                                      .additemtocart(quantity,
                                                          order, id, item.id)
                                                      .then((value) {
                                                    if (value) {
                                                      Navigator.pop(context);
                                                    }
                                                  });
                                                },
                                              ),
                                              FlatButton(
                                                child: Text("No"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Add to cart",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                })))
      ],
    );
  }
}

// ignore: must_be_immutable
class OrderDelivery extends StatefulWidget {
  MenuItemsListMd item;
  OrderDelivery({Key key, this.item}) : super(key: key);

  @override
  _OrderDeliveryState createState() => _OrderDeliveryState(item);
}

class _OrderDeliveryState extends State<OrderDelivery> {
  MenuItemsListMd item;
  _OrderDeliveryState(this.item);
  PersonData apiService = PersonData();
  CreateOrderAPI api = CreateOrderAPI();
  APIProfile apiEdit = APIProfile();
  int _orderId;
  TextEditingController _controllerAddress = TextEditingController();
  bool _isLocation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Delivery Check"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<PersonModel>(
          future: apiService.getPersondataFromSharedPref(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                PersonModel data = snapshot.data;
                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Address ${data.address}",
                                      style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    _controllerAddress.text != null
                                        ? Check()
                                        : X(),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(),
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(244, 243, 243, 1),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: TextField(
                                    controller: _controllerAddress,
                                    minLines: 3,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: InputBorder.none,
                                      hintText: "Adress",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Location",
                                      style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    _isLocation ? Check() : X(),
                                  ],
                                ),
                                SizedBox(height: 11),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isLocation = true;
                                    });
                                  },
                                  child: Text(
                                    "Turn on your location",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Phone",
                                      style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    data.phone.isActivate ? Check() : X(),
                                  ],
                                ),
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Container(
                            // padding: EdgeInsets.all(20),
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  // setState(() {
                                  //   _isLoading = true;
                                  // });
                                  final createLocation = <String, String>{
                                    "long": "0.000000",
                                    "lat": "-0.000000"
                                  };
                                  apiEdit.updateLocation(createLocation);
                                  final String address =
                                      _controllerAddress.text.toString();
                                  final upAdress = <String, String>{
                                    "address": address
                                  };
                                  apiEdit.updatePersoneAccount(
                                      upAdress, data.id);
                                  api
                                      .crateOrder("DELIVERY", "", item.rstid.id)
                                      .then((value) {
                                    if (value.id != null) {
                                      setState(() {
                                        _orderId = value.id;
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return ItemsListAddorders(
                                                id: item.rstid.id,
                                                order: _orderId);
                                          },
                                        ),
                                      );
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Next",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                print(snapshot.error);
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
