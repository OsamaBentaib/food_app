import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/screens/app/components/containers/create_order/create_order.dart';
import 'package:food_app/screens/app/components/containers/details/components/order_button.dart';
import 'package:food_app/screens/app/components/containers/details/components/update_button.dart';
import 'package:food_app/screens/app/components/containers/details/components/item_list.dart';
import 'package:food_app/screens/app/components/models/item_lists_models.dart';
import 'package:food_app/screens/app/restaurant/screens/menu/components/create_menu.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/components/profile_offer_service.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  MenuItemsListMd list;
  int id;
  Body({Key key, this.list, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemImage(
          imgSrc:
              "https://media-cdn.tripadvisor.com/media/photo-s/0e/fb/87/4a/photo0jpg.jpg",
        ),
        Expanded(
            child: SingleChildScrollView(
          child: ItemInfo(
            list: list,
            id: id,
          ),
        )),
      ],
    );
  }
}
// class Body extends StatelessWidget {
//   MenuItemsListMd list;
//   int id;
//   Body({Key key, this.list, this.id}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Stack(
//       children: <Widget>[
//         CustomScrollView(
//           slivers: <Widget>[
//             SliverAppBar(
//               expandedHeight: 250,
//               backgroundColor: bkcolor,
//               flexibleSpace: FlexibleSpaceBar(
//                 collapseMode: CollapseMode.pin,
//                 background: Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: NetworkImage(
//                               'https://media-cdn.tripadvisor.com/media/photo-s/0e/fb/87/4a/photo0jpg.jpg'),
//                           fit: BoxFit.cover)),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                             begin: Alignment.bottomRight,
//                             colors: [
//                           Colors.black,
//                           Colors.black.withOpacity(.3)
//                         ])),
//                     child: Padding(
//                       padding: EdgeInsets.all(20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                               Text(
//                                 list.title != null ? list.title : "",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: 25),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 Padding(
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Container(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Column(
//                               children: <Widget>[
//                                 Row(
//                                   children: <Widget>[
//                                     Geo(),
//                                     SizedBox(width: 5),
//                                     Text(
//                                       list.rstid.name != null
//                                           ? list.rstid.name
//                                           : "",
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w600,
//                                           color: kTextColor),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             priceTag(context,
//                                 price: list.price != null
//                                     ? double.parse(list.price)
//                                     : 0),
//                           ],
//                         ),
//                       ),
//                       Text(
//                         list.description != null ? list.description : "",
//                         style: TextStyle(
//                           height: 1.5,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Container(
//                         padding: EdgeInsets.all(10),
//                         child: OfferServices(
//                           dineIn: list.rstid.sof.isDinIn ? true : false,
//                           takeaway: list.rstid.sof.isTakeaway ? true : false,
//                           delevery: list.rstid.sof.isDelivery ? true : false,
//                           ncdelevery:
//                               list.rstid.sof.isNcDelivery ? true : false,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         "The makings of the Big Mac®",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, color: kTextColor),
//                       ),
//                       SizedBox(height: 10),
//                       ItemList(
//                         lid: list.id,
//                         id: id,
//                       ),
//                       SizedBox(height: 120),
//                     ],
//                   ),
//                 )
//               ]),
//             )
//           ],
//         ),
//         Positioned.fill(
//           bottom: 50,
//           child: Container(
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: id == null
//                   ? UpdateButton(
//                       size: size,
//                       press: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return CreateMenuItem(
//                                 itemList: list,
//                               );
//                             },
//                           ),
//                         );
//                       },
//                     )
//                   : OrderButton(
//                       size: size,
//                       press: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return StartOrder(
//                                 itemList: list,
//                               );
//                             },
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ),
//         )
//       ],
//     );
//   }

// }

// ignore: must_be_immutable
class ItemInfo extends StatelessWidget {
  MenuItemsListMd list;
  int id;
  ItemInfo({Key key, this.list, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          shopeName(name: "${list.rstid.name}"),
          TitlePriceRating(
            name: "${list.title}",
            categories: "BreakeFast, Hot Caffee",
            price: double.parse(list.price),
          ),
          Text(
            "${list.description}",
            style: TextStyle(
              height: 1.5,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: OfferServices(
              dineIn: list.rstid.sof.isDinIn ? true : false,
              takeaway: list.rstid.sof.isTakeaway ? true : false,
              delevery: list.rstid.sof.isDelivery ? true : false,
              ncdelevery: list.rstid.sof.isNcDelivery ? true : false,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text(
                "The Making of",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                " ${list.title}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
              ),
            ],
          ),
          SizedBox(height: 10),
          ItemList(
            lid: list.id,
            id: id,
          ),
          SizedBox(height: size.height * 0.1),
          // Free space  10% of total height
          id == null
              ? UpdateButton(
                  size: size,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CreateMenuItem(
                            itemList: list,
                          );
                        },
                      ),
                    );
                  },
                )
              : OrderButton(
                  size: size,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return StartOrder(
                            itemList: list,
                          );
                        },
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }

  Row shopeName({String name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: ksecondaryColor,
        ),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}

class ItemImage extends StatelessWidget {
  final String imgSrc;
  const ItemImage({
    Key key,
    this.imgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Image.network(
      imgSrc,
      height: size.height * 0.40,
      width: double.infinity,
      // it cover the 25% of total height
      fit: BoxFit.fill,
    );
  }
}

class TitlePriceRating extends StatelessWidget {
  final double price;
  final String categories;
  final String name;
  const TitlePriceRating({
    Key key,
    this.price,
    this.categories,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline,
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text("$categories"),
                  ],
                ),
              ],
            ),
          ),
          priceTag(context, price: price),
        ],
      ),
    );
  }

  ClipPath priceTag(BuildContext context, {double price}) {
    return ClipPath(
      clipper: PricerCliper(),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 16),
        height: 66,
        width: 65,
        color: kPrimaryColor,
        child: Text(
          "\$$price",
          style: Theme.of(context).textTheme.title.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
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
