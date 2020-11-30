import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:food_app/screens/app/restaurant/local/shared_preferences/sharedPref.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/reviews_model.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/constants.dart';

final userDao = UserDao();
SharedPrefRestaurantReviews sharedPref = SharedPrefRestaurantReviews();

class ReviewsHttpService {
  Future<List<ReviewsMd>> getReviews(int id, int ref) async {
    final String url = baseURL + "api/account/restaurant/$id/reviews/";
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
    ).timeout(
      Duration(seconds: 20),
      onTimeout: () {
        return null;
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      if (ref == null) {
        sharedPref.remove("RestaurantReviews");
        sharedPref.save("RestaurantReviews", response.body);
      }
      return reviewsFromJson(response.body);
    } else {
      throw "Can't get posts.";
    }
  }

  Future<List<ReviewsMd>> getReviewsFromSharedPref() async {
    final response = await sharedPref.read("RestaurantReviews");
    print("Shared Pref rating");
    print(response);
    return reviewsFromJson(response);
  }

  Future<ReviewsMd> checkReviews(
    int id,
  ) async {
    final String url = baseURL + "api/account/restaurant/$id/reviews/check/";
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final res = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
    ).timeout(
      Duration(seconds: 20),
      onTimeout: () {
        return null;
      },
    );
    print("response ${res.statusCode}");
    if (res.statusCode == 200) {
      return ReviewsMd.fromJson(json.decode(res.body));
    } else {
      return null;
    }
  }
}
