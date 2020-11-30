import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/components/icons.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/connection/reviews_api_connection.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/reviews_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Reviews extends StatefulWidget {
  final int id;
  final int ref;

  Reviews({Key key, this.id, this.ref}) : super(key: key);

  @override
  _ReviewsState createState() => _ReviewsState(id, ref);
}

class _ReviewsState extends State<Reviews> {
  final ReviewsHttpService httpService = ReviewsHttpService();
  int id, ref;
  _ReviewsState(this.id, this.ref);
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    httpService.getReviews(id, ref).then((value) => setState(() {
          isLoaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Reviews"),
        ),
        body: FutureBuilder(
          future: httpService.getReviewsFromSharedPref(),
          builder:
              (BuildContext context, AsyncSnapshot<List<ReviewsMd>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<ReviewsMd> posts = snapshot.data;
                return ListView(
                  children: posts
                      .map(
                        (ReviewsMd post) => Container(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 15, bottom: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.grey[200]),
                                  right: BorderSide(
                                      width: 1, color: Colors.grey[200]),
                                  left: BorderSide(
                                      width: 1, color: Colors.grey[200]),
                                  top: BorderSide(
                                      width: 1, color: Colors.grey[200]),
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      SmoothStarRating(
                                        borderColor: kPrimaryColor,
                                        rating: post.rate != null
                                            ? double.parse(post.rate)
                                            : 0.0,
                                        size: 15,
                                        // onRatingChanged: onRatingChanged,
                                      ),
                                      Container(
                                        child: Dot(),
                                      ),
                                      Text(
                                        post.rate != null ? "${post.rate}" : "",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )),
                                  Text(
                                    post.content != null
                                        ? "${post.content}"
                                        : "",
                                    style: TextStyle(
                                        color: Colors.grey, height: 1.4),
                                  ),
                                  Text(
                                    post.date != null ? "${post.date}" : "",
                                    style: TextStyle(
                                        color: Colors.grey, height: 1.4),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )),
                      )
                      .toList(),
                );
              } else {
                return Center(
                  child: Text("There's No Reviews Yet ${snapshot.error}"),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CheckReviews(id: widget.id),
              ),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: kPrimaryColor,
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Reviews"),
        ),
        body: FutureBuilder(
          future: httpService.getReviewsFromSharedPref(),
          builder:
              (BuildContext context, AsyncSnapshot<List<ReviewsMd>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<ReviewsMd> posts = snapshot.data;
                return ListView(
                  children: posts
                      .map(
                        (ReviewsMd post) => Container(
                            margin: EdgeInsets.all(10),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 15, bottom: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.grey[200]),
                                  right: BorderSide(
                                      width: 1, color: Colors.grey[200]),
                                  left: BorderSide(
                                      width: 1, color: Colors.grey[200]),
                                  top: BorderSide(
                                      width: 1, color: Colors.grey[200]),
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      SmoothStarRating(
                                        borderColor: kPrimaryColor,
                                        rating: post.rate != null
                                            ? double.parse(post.rate)
                                            : 0.0,
                                        size: 15,
                                        // onRatingChanged: onRatingChanged,
                                      ),
                                      Container(
                                        child: Dot(),
                                      ),
                                      Text(
                                        post.rate != null ? "${post.rate}" : "",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )),
                                  Text(
                                    post.content != null
                                        ? "${post.content}"
                                        : "",
                                    style: TextStyle(
                                        color: Colors.grey, height: 1.4),
                                  ),
                                  Text(
                                    post.date != null ? "${post.date}" : "",
                                    style: TextStyle(
                                        color: Colors.grey, height: 1.4),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )),
                      )
                      .toList(),
                );
              } else {
                return Center(
                  child: Text("There's No Reviews Yet ${snapshot.error}"),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
    }
  }
}

// ignore: must_be_immutable
class CheckReviews extends StatelessWidget {
  final int id;
  CheckReviews({Key key, this.id}) : super(key: key);
  ReviewsHttpService api = ReviewsHttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<ReviewsMd>(
      future: api.checkReviews(id),
      builder: (context, snapshot) {
        ReviewsMd data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ReviewAdd(
              snapshot: data,
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}

class ReviewAdd extends StatefulWidget {
  ReviewsMd snapshot;
  ReviewAdd({Key key, this.snapshot}) : super(key: key);

  @override
  _ReviewAddState createState() => _ReviewAddState(snapshot);
}

class _ReviewAddState extends State<ReviewAdd> {
  ReviewsMd snapshot;
  _ReviewAddState(this.snapshot);
  bool update;
  double rate;
  // ignore: unused_field
  bool _isFieldrateValid;
  bool _isFieldcontentValid;
  TextEditingController _controllercontent = TextEditingController();

  @override
  void initState() {
    if (snapshot != null) {
      update = true;
      _isFieldrateValid = true;
      _isFieldcontentValid = true;
      _controllercontent.text = snapshot.content;
    }
    print(snapshot.rate);
    print(snapshot.content);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Review"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Rate",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
              ),
              SizedBox(
                height: 15,
              ),
              SmoothStarRating(
                borderColor: kPrimaryColor,
                rating: 0,
                size: 30,
                onRated: (rating) => rate = rating,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: TextField(
                    minLines: 10,
                    maxLines: 15,
                    controller: _controllercontent,
                    decoration: InputDecoration(
                      hintText: 'Write your review here',
                      filled: true,
                      fillColor: kPrimaryColor.withOpacity(.1),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      errorText:
                          _isFieldcontentValid == null || _isFieldcontentValid
                              ? null
                              : "review is required",
                    ),
                  ),
                ),
              ),
              Container(
                  // padding: EdgeInsets.all(20),
                  width: double.infinity,
                  // it will cover 80% of total width
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        child: Text(update == true ? "UPDATE" : "CREATE"),
                        onTap: () {
                          if (update == false) {
                            String content = _controllercontent.text.toString();
                            print(rate);
                            print(content);
                          } else if (update == true) {}
                        },
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
