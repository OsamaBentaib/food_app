import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:food_app/screens/app/restaurant/local/shared_preferences/sharedPref.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/rating_models.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/constants.dart';

final userDao = UserDao();
SharedPrefRestaurantRating sharedPref = SharedPrefRestaurantRating();

class RtAPI {
  Future<List<RatingMod>> getrate(int id) async {
    final end = "api/account/restaurant/$id/rating/";
    final url = baseURL + end;
    print(url);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
    );
    print("${response.statusCode}" + "=> rating");
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      sharedPref.remove("RestaurantRating");
      sharedPref.save("RestaurantRating", response.body);
      return ratingFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<RatingMod>> getRatingFromSharedPref() async {
    final response = await sharedPref.read("RestaurantRating");
    print("Shared Pref rating");
    print(response);
    return ratingFromJson(response);
  }
}
