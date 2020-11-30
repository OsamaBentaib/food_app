import 'package:food_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/connection/rating_api_connection.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/rating_models.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingBuilder extends StatefulWidget {
  final int id, from;
  RatingBuilder({Key key, this.id, this.from}) : super(key: key);

  @override
  _RatingBuilderState createState() => _RatingBuilderState(id, from);
}

class _RatingBuilderState extends State<RatingBuilder> {
  int deleveryrating = 0, takeawayrating = 0, dinInrating = 0, rating = 0;

  double dinInrate, takeawayrate, deleveryrate, foodrate;

  bool isdinin, istakeaway, isdelivery;

  RtAPI apiService = RtAPI();
  int id, from;
  _RatingBuilderState(this.id, this.from);
  bool isLoaded = false;
  bool _nodata = false;
  @override
  void initState() {
    super.initState();
    apiService.getrate(widget.id).then((value) => setState(() {
          isLoaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded && _nodata) {
      return Container(
        child: FutureBuilder(
          future: apiService.getRatingFromSharedPref(),
          builder:
              (BuildContext context, AsyncSnapshot<List<RatingMod>> snapshot) {
            if (snapshot.hasData && snapshot.data.length > 0) {
              List<RatingMod> rateLists = snapshot.data;
              deleveryrating = rateLists
                  .where((element) => element.deliveryrate != null)
                  .length;
              takeawayrating = rateLists
                  .where((element) => element.takeawayrate != null)
                  .length;
              dinInrating = rateLists
                  .where((element) => element.dinInrate != null)
                  .length;
              rating =
                  rateLists.where((element) => element.rating != null).length;
              double sum1 = 0;
              rateLists.forEach((e) {
                sum1 += double.parse(e.deliveryrate);
              });
              double dlrate = sum1 / deleveryrating;
              String dlStrRate = dlrate.toStringAsFixed(1);
              double sum2 = 0;
              rateLists.forEach((e) {
                sum2 += double.parse(e.dinInrate);
              });
              double dininrate = sum2 / dinInrating;
              String dinStrRate = dininrate.toStringAsFixed(1);
              double sum3 = 0;
              rateLists.forEach((e) {
                sum3 += double.parse(e.takeawayrate);
              });
              double takerate = sum3 / takeawayrating;
              String takeStrRate = takerate.toStringAsFixed(1);
              // double rate = (double.parse(dlStrRate) +
              //         double.parse(dinStrRate) +
              //         double.parse(takeStrRate)) /
              //     3;
              // String rateStr = rate.toStringAsFixed(1);
              return Rating(
                  deleveryrating: deleveryrating,
                  takeawayrating: takeawayrating,
                  dinInrating: dinInrating,
                  rating: rating,
                  dinInrate: dinStrRate,
                  takeawayrate: takeStrRate,
                  deleveryrate: dlStrRate,
                  from: from);
            } else {
              return Text("There is No Rating Yet");
            }
          },
        ),
      );
    } else {
      return Container(
        child: FutureBuilder(
          future: apiService.getRatingFromSharedPref(),
          builder:
              (BuildContext context, AsyncSnapshot<List<RatingMod>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data.length > 0) {
                List<RatingMod> rateLists = snapshot.data;
                deleveryrating = rateLists
                    .where((element) => element.deliveryrate != null)
                    .length;
                takeawayrating = rateLists
                    .where((element) => element.takeawayrate != null)
                    .length;
                dinInrating = rateLists
                    .where((element) => element.dinInrate != null)
                    .length;
                rating =
                    rateLists.where((element) => element.rating != null).length;
                double sum1 = 0;
                rateLists.forEach((e) {
                  sum1 += double.parse(e.deliveryrate);
                });
                double dlrate = sum1 / deleveryrating;
                String dlStrRate = dlrate.toStringAsFixed(1);
                double sum2 = 0;
                rateLists.forEach((e) {
                  sum2 += double.parse(e.dinInrate);
                });
                double dininrate = sum2 / dinInrating;
                String dinStrRate = dininrate.toStringAsFixed(1);
                double sum3 = 0;
                rateLists.forEach((e) {
                  sum3 += double.parse(e.takeawayrate);
                });
                double takerate = sum3 / takeawayrating;
                String takeStrRate = takerate.toStringAsFixed(1);
                // double rate = (double.parse(dlStrRate) +
                //         double.parse(dinStrRate) +
                //         double.parse(takeStrRate)) /
                //     3;
                // String rateStr = rate.toStringAsFixed(1);
                return Rating(
                    deleveryrating: deleveryrating,
                    takeawayrating: takeawayrating,
                    dinInrating: dinInrating,
                    rating: rating,
                    dinInrate: dinStrRate,
                    takeawayrate: takeStrRate,
                    deleveryrate: dlStrRate,
                    from: from);
              } else {
                setState(() {
                  _nodata = true;
                });

                return Text("There is No Rating Yet");
              }
            } else {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 100,
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[100]),
                    ),
                    Container(
                      height: 20,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[100]),
                    ),
                    Container(
                      height: 20,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[100]),
                    ),
                    Container(
                      height: 20,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[100]),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      );
    }
  }
}

// class RatingBuilder extends StatefulWidget {
//   final int id;
//   RatingBuilder({Key key, this.id}) : super(key: key);

//   @override
//   _RatingBuilderState createState() => _RatingBuilderState(id);
// }

// class _RatingBuilderState extends State<RatingBuilder> {
//   int id;
//   _RatingBuilderState(this.id);
//   final RateAPIService httpService = RateAPIService();
//   int deleveryrating = 0, takeawayrating = 0, dinInrating = 0, rating = 0;
//   double dinInrate, takeawayrate, deleveryrate, foodrate;
//   bool isdinin, istakeaway, isdelivery;
//   @override
//   Widget build(BuildContext context) {
//     FutureBuilder(
//       future: httpService.getrate(id),
//       builder: (BuildContext context, AsyncSnapshot<List<RatingMod>> snapshot) {
//         if (snapshot.hasData) {
//           print(id);
//           // List<RatingMod> rateLists = snapshot.data;
//           // deleveryrating =
//           //     rateLists.where((element) => element.deliveryrate != null).length;
//           // takeawayrating =
//           //     rateLists.where((element) => element.takeawayrate != null).length;
//           // dinInrating =
//           //     rateLists.where((element) => element.dinInrate != null).length;
//           // rating = rateLists.where((element) => element.rating != null).length;
//           // for (var i = 0; i < rateLists.length; i++) {
//           //   deleveryrate += rateLists[i].deliveryrate;
//           //   dinInrate += rateLists[i].dinInrate;
//           //   takeawayrate += rateLists[i].takeawayrate;
//           // }
//           // print("Deliveryrating $deleveryrating");
//           return Text("Rating");

//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }

class Rating extends StatelessWidget {
  final int deleveryrating, takeawayrating, dinInrating, rating, from;
  final String dinInrate, takeawayrate, deleveryrate;
  final bool isdinin, istakeaway, isdelivery;
  Rating({
    Key key,
    this.deleveryrate,
    this.deleveryrating,
    this.dinInrate,
    this.dinInrating,
    this.rating,
    this.takeawayrate,
    this.takeawayrating,
    this.isdelivery,
    this.isdinin,
    this.istakeaway,
    this.from,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Rating",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
              ),
              ChUp(),
            ],
          )),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    children: <Widget>[
                      Dash(),
                      Text(
                        textDinin,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kTextColor),
                      ),
                      Dot(),
                      SmoothStarRating(
                        borderColor: kPrimaryColor,
                        rating: double.parse(dinInrate),
                        size: 15,
                      ),
                      Dot(),
                      Text(
                        "$dinInrating Rating",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: kTextColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    children: <Widget>[
                      Dash(),
                      Text(
                        textTakeaway,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kTextColor),
                      ),
                      Dot(),
                      SmoothStarRating(
                        borderColor: kPrimaryColor,
                        rating: double.parse(takeawayrate),
                        size: 15,
                      ),
                      Dot(),
                      Text(
                        "$takeawayrating Rating",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: kTextColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    children: <Widget>[
                      Dash(),
                      Text(
                        textdelevery,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kTextColor),
                      ),
                      Dot(),
                      SmoothStarRating(
                        borderColor: kPrimaryColor,
                        rating: double.parse(deleveryrate),
                        size: 15,
                      ),
                      Dot(),
                      Text(
                        "$deleveryrating Rating",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: kTextColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
