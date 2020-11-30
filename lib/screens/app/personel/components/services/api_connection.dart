import 'dart:convert';
import 'dart:io';

import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/components/data/sharedPref.dart';
import 'package:food_app/screens/app/personel/components/models/person_models.dart';

import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;

SharedPrefUser sharedPrefUser = SharedPrefUser();


final userDao = UserDao();

class PersonData {
  Future<PersonModel> getPersondata() async {
    final end = "api/account/personel/";
    final url = baseURL + end;
    print(url);
    User user = await userDao.getUserWithId(0);
    final String token = user.token;
    print(token);
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
    );
    print("Response user ${response.statusCode}");
    print(response.body);
    if (response.statusCode == 200) {
      sharedPrefUser.remove("Person_data");
      sharedPrefUser.save("Person_data", response.body);
      return PersonModel.fromMap(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<PersonModel> getPersondataFromSharedPref() async {
    final response = await sharedPrefUser.read("Person_data");
    print("From SharedPerfs User----->");
    print(response);
    if (response != null) {
      return PersonModel.fromMap(jsonDecode(response));
    } else {
      return null;
    }
  }
}
