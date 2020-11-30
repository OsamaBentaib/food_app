import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:food_app/screens/auth/register/register_form.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/screens/auth/model/api_model.dart';
import 'package:food_app/constants.dart';

final tokenEndpoint = "rest-auth/registration/";
final tokenURL = baseURL + tokenEndpoint;

Future<Token> getregisterToken(UserRegister userRegister) async {
  print(tokenURL);
  final http.Response response = await http.post(
    tokenURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userRegister.toDatabaseJson()),
  );
  if (response.statusCode == 201) {
    return Token.fromJson(json.decode(response.body));
  } else {
    Errors errors = Errors.fromJson(json.decode(response.body));
    print(errors.email);
    print(errors.password);
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

final end = "api/token/add/";
final url = baseURL + end;
Future<AccountType> createAccountType(int account, String token) async {
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Token $token',
    },
    body: jsonEncode({
      'account': account,
    }),
  );

  if (response.statusCode == 201) {
    print(json.decode(response.body));
    return AccountType.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create account.');
  }
}
