import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/components/models/person_models.dart';

class Data {
  int id;
  Data({this.id});
  factory Data.fromJson(Map<String, dynamic> map) {
    return Data(id: map["id"]);
  }
}

final userDao = UserDao();

class APIProfile {
  Future<int> createPersoneAccount(PersonModel data) async {
    final url = baseURL + "api/account/personel/add/";
    print(url);
    print(data);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    print(token);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: personToJson(data),
    );
    print(personToJson(data));
    print(response.statusCode);
    if (response.statusCode == 201) {
      print(json.decode(response.body));
      Data intId = Data.fromJson(json.decode(response.body));
      return intId.id;
    } else {
      return null;
    }
  }

  Future<bool> updatePersoneAccount(data, id) async {
    final url = baseURL + "api/account/personel/$id/update/";
    print(url);
    print(data);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    print(token);
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: json.encode(data),
    );
    print(json.encode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> cratePhone(data, int code) async {
    final url = baseURL + "api/account/personel/phone/add/code/$code/";
    print(url);
    print(data);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    print(token);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: json.encode(data),
    );
    print(json.encode(data));
    print("respons for phone ---> ${response.statusCode}");
    print(response.body);
    if (response.statusCode == 201) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updatePhone(data) async {
    final url = baseURL + "api/account/personel/phone/update/";
    print(url);
    print(data);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    print(token);
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
      body: json.encode(data),
    );
    print(json.encode(data));
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createLocation(create) async {
    final url = baseURL + "api/account/person/location/add/";
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
    final url = baseURL + "api/account/person/location/update/";
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
