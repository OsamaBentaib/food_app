import 'dart:io';

import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/components/data/sharedPref.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/models/orders_model.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;

SharedPrefOrders sharedPref = SharedPrefOrders();
final userDao = UserDao();

class APIOrders {
  Future<List<Orders>> getOrdersUserLists() async {
    final end = "api/orders/person/all/";
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
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      sharedPref.remove("orders");
      sharedPref.save("orders", response.body);
      return ordersListFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Orders>> getOrdersUserFromSharedPref() async {
    final response = await sharedPref.read("orders");
    if (response != null) {
      return ordersListFromJson(response);
    } else {
      return null;
    }
  }
}
