import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:food_app/screens/app/restaurant/local/models/serviceoffer_model.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/constants.dart';

final userDao = UserDao();

class SOAPIService {
  Future<ServiceOffer> getServiceOffer(int id) async {
    final end = "api/account/restaurant/$id/serviceoffer/";
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
    print("statue for serviceoffer");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return ServiceOffer.fromMap(json.decode(response.body));
    } else {
      return null;
    }
  }
}
