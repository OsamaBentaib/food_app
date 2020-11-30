import 'dart:convert';
import 'dart:io';

import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/restaurant/local/models/item_model.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;

class MenuApiService {
  final userDao = UserDao();
  Future<List<ItemListMd>> getmenuLists() async {
    final end = "api/menu/items/restaurant/Lists/";
    final url = baseURL + end;
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
    );
    if (response.statusCode == 200) {
      return itemListFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createMenu(ItemToJson data) async {
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    print(data);
    print(token);
    final response = await http.post(
      baseURL + "api/menu/items/restaurant/list/add/",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: itemCreateToJson(data),
    );
    print(itemCreateToJson(data));
    print(response.statusCode);
    if (response.statusCode == 201) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updatemenu(ItemToJson data, int id) async {
    final url = baseURL + "api/menu/items/restaurant/list/$id/update/";
    print(url);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: itemCreateToJson(data),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteMenu(int id) async {
    final url = baseURL + "api/menu/items/restaurant/list/$id/delete/";
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
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }
}
