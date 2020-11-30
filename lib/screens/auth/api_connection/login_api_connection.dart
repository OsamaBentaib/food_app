import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:food_app/screens/auth/model/api_model.dart';
import 'package:food_app/constants.dart';

final _tokenEndpoint = "rest-auth/login/";
final _tokenURL = baseURL + _tokenEndpoint;

Future<Token> getloginToken(UserLogin userLogin) async {
  print(_tokenURL);
  final http.Response response = await http.post(
    _tokenURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    return Token.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

final end = "api/token/";
final url = baseURL + end;

Future<Account> getAccountToken(String userToken) async {
  print(url);
  final token = userToken;
  print(token);
  final http.Response response = await http.get(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    HttpHeaders.authorizationHeader: 'Token $token',
  });
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    return Account.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
