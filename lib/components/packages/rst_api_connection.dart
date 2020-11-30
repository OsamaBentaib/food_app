import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:food_app/screens/app/restaurant/local/models/restaurant_model.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/constants.dart';

final userDao = UserDao();

class APIService {
  Future<RestaurantForDB> getRestaurant() async {
    final end = "api/account/restaurant/";
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
      return RestaurantForDB.fromMap(json.decode(response.body));
    } else {
      return null;
    }
  }
}
