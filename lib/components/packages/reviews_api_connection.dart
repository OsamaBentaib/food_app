import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/constants.dart';

final userDao = UserDao();

class ReviewsAPIService {
  Future<List<ReviewsMd>> getrate(int id) async {
    final end = "api/account/restaurant/$id/reviews/";
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
      print(json.decode(response.body));
      final data = json.decode(response.body);
      List<ReviewsMd> list = data.map((c) => ReviewsMd.fromMap(c)).toList();
      return list;
    } else {
      return null;
    }
  }
}
