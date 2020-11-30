import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:food_app/screens/app/components/containers/orderdetails/rating_control/rate_models.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/constants.dart';

final userDao = UserDao();

class APIRateingControl {
  Future<Ratemodels> arteCkeck(int rstid) async {
    final end = "api/account/restaurant/$rstid/rating/check/";
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
    print("${response.statusCode}" + "=> rating ckeck");
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return Ratemodels.fromJson(json.decode(response.body));
    } else {
      return Ratemodels.fromJson(json.decode("[]"));
    }
  }

  Future<int> createRate(int rstid, double rate, double dinInrating,
      double takeawayrating, double deliveryrating) async {
    final end = "api/account/restaurant/$rstid/rating/add/";
    final url = baseURL + end;
    print(url);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final create = <String, double>{
      "rate": rate,
      "dinin_rate": dinInrating,
      "takeaway_rate": takeawayrating,
      "delivery_rate": deliveryrating
    };
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: jsonEncode(create),
    );
    print("${response.statusCode}" + "=> rating add");
    print(response.body);
    return response.statusCode;
  }
}
