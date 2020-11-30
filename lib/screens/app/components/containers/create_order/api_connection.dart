import 'dart:convert';
import 'dart:io';

import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/components/containers/create_order/model.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;

class CreateOrderAPI {
  final userDao = UserDao();
  Future<ID> crateOrder(String _type, String _time, int rstid) async {
    final url = baseURL + "api/orders/restaurant/$rstid/order/create/";
    print(url);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final body = <String, String>{
      "order_status": "CREATED",
      "order_time": _time,
      "order_type": _type
    };
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Token $token',
        },
        body: jsonEncode(body));
    print(response.statusCode);
    if (response.statusCode == 201) {
      print(json.decode(response.body));
      return ID.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<bool> additemtocart(int qauntity, int order, int rstid, int item) async {
    final url =
        baseURL + "api/orders/restaurant/$rstid/order/$order/item/create/";
    print(url);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: jsonEncode(<String, int>{"quantity": qauntity, "order_item":item}),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }
}
