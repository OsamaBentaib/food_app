import 'dart:convert';
import 'dart:io';

import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/components/models/item_lists_models.dart';
import 'package:food_app/screens/app/restaurant/local/shared_preferences/sharedPref.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;

SharedPrefMenu sharedPref = SharedPrefMenu();

class MenuListsApiService {
  final userDao = UserDao();
  Future<int> getRestaurantMenuLists() async {
    final url = baseURL + "api/menu/items/restaurant/lists/";
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
      Duration(seconds: 20),
      onTimeout: () {
        return null;
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      sharedPref.remove("Menu");
      sharedPref.save("Menu", response.body);
      return response.statusCode;
    } else if (response.statusCode == 404) {
      sharedPref.remove("Menu");
      sharedPref.save("Menu", []);
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  Future<List<MenuItemsListMd>> getRestaurantMenuListsWithId(int id) async {
    final end = "api/menu/items/restaurant/$id/lists/";
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
      Duration(seconds: 20),
      onTimeout: () {
        return null;
      },
    );
    print(response.statusCode);
    print(response.body);
    print(itemListsFromJson(response.body));
    if (response.statusCode == 200) {
      if (id == null) {
        sharedPref.remove("Menu");
        sharedPref.save("Menu", response.body);
      }
      return itemListsFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<MenuItemsListMd>> getMenuFromSharedPref() async {
    final response = await sharedPref.read("Menu");
    print("Shared Pref of Menu");
    print(response);
    if (response != null) {
      return itemListsFromJson(response);
    } else {
      return null;
    }
  }
}

class IntGAPI {
  final userDao = UserDao();
  Future<List<IntG>> getIntG(int lid) async {
    final end = "api/menu/items/restaurant/list/$lid/intg/";
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
    print(intGFromJson(response.body));
    if (response.statusCode == 200) {
      return intGFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createIntG(IntG data, int lid) async {
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    print(data);
    print(token);
    final response = await http.post(
      baseURL + "api/menu/items/restaurant/list/$lid/intg/add/",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: intGToJson(data),
    );
    print(intGToJson(data));
    print(response.statusCode);
    if (response.statusCode == 201) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateIntG(IntG data, int lid, int intgid) async {
    final url =
        baseURL + "api/menu/items/restaurant/list/$lid/intg/$intgid/update/";
    print(url);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: intGToJson(data),
    );
    print(intGToJson(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteIntG(int lid, int intgid) async {
    final url =
        baseURL + "api/menu/items/restaurant/list/$lid/intg/$intgid/delete/";
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
    return true;
  }
}
