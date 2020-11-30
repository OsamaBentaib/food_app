import 'dart:convert';
import 'dart:io';

import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/restaurant/local/shared_preferences/sharedPref.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/models/orders_model.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;

SharedPrefOrders sharedPref = SharedPrefOrders();

class OrdersApiService {
  final userDao = UserDao();
  Future<List<Orders>> getOrdersLists(
      String page, String status, int start, int e) async {
    final end = "api/orders/restaurant/$page/s/$status/$start/$e/";
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
    print(ordersListFromJson(response.body));
    if (response.statusCode == 200) {
      if (status == "all") {
        sharedPref.remove("orders_all");
        sharedPref.save("orders_all", response.body);
      } else if (status == "SUBMITED") {
        sharedPref.remove("orders_submited");
        sharedPref.save("orders_submited", response.body);
      } else if (status == "CONFIRMED") {
        sharedPref.remove("orders_confirmed");
        sharedPref.save("orders_confirmed", response.body);
      } else if (status == "READY") {
        sharedPref.remove("orders_ready");
        sharedPref.save("orders_ready", response.body);
      } else if (status == "DELIVERED") {
        sharedPref.remove("orders_delivery");
        sharedPref.save("orders_delivery", response.body);
      } else if (status == "FINISHED") {
        sharedPref.remove("orders_takeaway");
        sharedPref.save("orders_takeaway", response.body);
      } else if (status == "CANCLED") {
        sharedPref.remove("orders_cancled");
        sharedPref.save("orders_cancled", response.body);
      }
      return ordersListFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Orders>> getOrdersFromSharedPref(String status) async {
    print("Shared Pref of orders");
    if (status == "all") {
      final response = await sharedPref.read("orders_all");
      print(response);
      if (response != null) {
        return ordersListFromJson(response);
      } else {
        return null;
      }
    } else if (status == "SUBMITED") {
      final response = await sharedPref.read("orders_submited");
      print(response);
      if (response != null) {
        return ordersListFromJson(response);
      } else {
        return null;
      }
    } else if (status == "CONFIRMED") {
      final response = await sharedPref.read("orders_confirmed");
      print(response);
      if (response != null) {
        return ordersListFromJson(response);
      } else {
        return null;
      }
    } else if (status == "READY") {
      final response = await sharedPref.read("orders_ready");
      print(response);
      if (response != null) {
        return ordersListFromJson(response);
      } else {
        return null;
      }
    } else if (status == "DELIVERED") {
      final response = await sharedPref.read("orders_delivery");
      print(response);
      if (response != null) {
        return ordersListFromJson(response);
      } else {
        return null;
      }
    } else if (status == "FINISHED") {
      final response = await sharedPref.read("orders_takeaway");
      print(response);
      if (response != null) {
        return ordersListFromJson(response);
      } else {
        return null;
      }
    } else if (status == "CANCLED") {
      final response = await sharedPref.read("orders_cancled");
      print(response);
      if (response != null) {
        return ordersListFromJson(response);
      } else {
        return null;
      }
    }
    return null;
  }

  Future<bool> updateOrder(int order, int person, String update) async {
    final end = "api/orders/restaurant/person/$person/order/$order/";
    final url = baseURL + end;
    print(url);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final body = jsonEncode(<String, String>{"order_status": update});
    final response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Token $token',
        },
        body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateOrderByPerson(int order, int restaurant, String update) async {
    final end = "api/orders/restaurant/$restaurant/order/$order/update/";
    final url = baseURL + end;
    print(url);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final body = jsonEncode(<String, String>{"order_status": update});
    final response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Token $token',
        },
        body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteOrder(int order, int person) async {
    final end = "api/orders/restaurant/person/$person/order/$order/delete/";
    final url = baseURL + end;
    print(url);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
    );
    print(response.statusCode);
    print(response.body);
    print(ordersListFromJson(response.body));
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
