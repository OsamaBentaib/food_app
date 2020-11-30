import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:food_app/screens/app/restaurant/local/shared_preferences/sharedPref.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/profile_model.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/constants.dart';

final userDao = UserDao();
SharedPrefRestaurant sharedPref = SharedPrefRestaurant();

class ApiConnection {
  Future<RestaurantProfileModel> getRestaurant() async {
    final end = "api/account/restaurant/profile/";
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
    ).timeout(
      Duration(seconds: 30),
      onTimeout: () {
        return null;
      },
    );
    print(response.statusCode);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      sharedPref.remove("RestaurantProfile");
      sharedPref.save("RestaurantProfile", response.body);
      return RestaurantProfileModel.fromMap(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<RestaurantProfileModel> getRestaurantFromSharedPref() async {
    final response = await sharedPref.read("RestaurantProfile");
    print("Shared Pref");
    print(response);
    if (response != null) {
      return RestaurantProfileModel.fromMap(json.decode(response));
    } else {
      return null;
    }
  }

  Future<RestaurantProfileModel> getRestaurantWithId(int id) async {
    final end = "api/account/restaurant/$id/profile/";
    final url = baseURL + end;
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
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return RestaurantProfileModel.fromMap(json.decode(response.body));
    } else {
      return null;
    }
  }
}
