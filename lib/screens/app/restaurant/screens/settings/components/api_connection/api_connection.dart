import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:food_app/screens/app/restaurant/screens/settings/components/models/api_models.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/constants.dart';

final end = "lists/cities/";
final url = baseURL + end;
final userDao = UserDao();

class ApiService {
  Future<bool> createRestaurant(Restaurant data) async {
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.post(
      baseURL + "api/account/restaurant/add/",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: restaurantToJson(data),
    );
    print(json.encode(data));
    print(response.statusCode);
    print(response.body);
    return true;
    // if (response.statusCode == 201) {
    //   print(json.decode(response.body));
    //   return true;
    // } else {
    //   return false;
    // }
  }

  Future<bool> updateRestaurant(data) async {
    final url = baseURL + "api/account/restaurant/update/";
    print(url);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: jsonEncode(data),
    );
    print(jsonEncode(data));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }
}

class STApiService {
  Future<List<ServicesLists>> getServicesList() async {
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.get(
      baseURL + "api/lists/services/",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> body = jsonDecode(response.body);

      List<ServicesLists> lists = body
          .map(
            (dynamic item) => ServicesLists.fromJson(item),
          )
          .toList();

      return lists;
    } else {
      return null;
    }
  }

  Future<bool> updateServicestype(String service) async {
    final url = baseURL + "api/account/restaurant/update/";
    print(url);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: jsonEncode(<String, String>{'Service': service}),
    );
    print(jsonEncode(<String, String>{'Service': service}));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }
}

class SOApiService {
  Future<bool> createServiceOffer(
      bool isdinin, istakeaway, isdelivery, isNcdelivery) async {
    final url = baseURL + "api/account/restaurant/serviceoffer/add/";
    print(url);
    final body = jsonEncode(<String, bool>{
      "isDelivery": isdelivery,
      "isNcDelivery": isNcdelivery,
      "isTakeaway": istakeaway,
      "isDinIn": isdinin
    });
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: body,
    );
    print(jsonEncode(body));
    print(response.statusCode);
    if (response.statusCode == 201) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateServiceOffer(
      bool isdinin, istakeaway, isdelivery, isNcdelivery) async {
    final url = baseURL + "api/account/restaurant/serviceoffer/update/";
    print(url);
    final body = jsonEncode(<String, bool>{
      'isDelivery': isdelivery,
      "isNcDelivery": isNcdelivery,
      "isTakeaway": istakeaway,
      "isDinIn": isdinin
    });
    var user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: body,
    );
    print("response ${response.statusCode}");
    print(jsonEncode(body));
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }
}

class LocationApi {
  Future<bool> createLocation(create) async {
    final url = baseURL + "api/account/restaurant/location/add/";
    print(url);
    var user = await userDao.getUserWithId(0);
    final String token = user.token;
    print(token);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: jsonEncode(create),
    );
    print(jsonEncode(create));
    print(response.body);
    print("response ${response.statusCode}");
    if (response.statusCode == 201) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateLocation(create) async {
    final url = baseURL + "api/account/restaurant/location/update/";
    print(url);
    var user = await userDao.getUserWithId(0);
    final String token = user.token;
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: jsonEncode(create),
    );
    print("response ${response.statusCode}");
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }
}
