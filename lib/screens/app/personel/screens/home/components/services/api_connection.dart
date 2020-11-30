import 'dart:io';

import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/components/data/sharedPref.dart';
import 'package:food_app/screens/app/restaurant/screens/profile/models/profile_model.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;

SharedPupularItems sharedPrefItems = SharedPupularItems();
SharedPrefDinin sharedPrefDinin = SharedPrefDinin();
SharedPrefTakeaway sharedPrefTakeaway = SharedPrefTakeaway();
SharedPrefDelivery sharedPrefDelivery = SharedPrefDelivery();
SharedPrefPromo sharedPrefPromo = SharedPrefPromo();
SharedPrefOpen sharedPrefOpen = SharedPrefOpen();
SharedPrefScore sharedPrefScore = SharedPrefScore();
SharedPrefVerified sharedPrefVerified = SharedPrefVerified();
final userDao = UserDao();

class APIConnect {
  Future<List<RestaurantProfileModel>> getPopularItemLists(String city) async {
    final end = "api/fliters/list/c/$city/";
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
    ).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        return null;
      },
    );
    print(url);
    print("response statusCode ---> ${response.statusCode}");
    print("response body ---> ${response.body}");
    print(url);
    print("response statusCode ---> ${response.statusCode}");
    print("response body ---> ${response.body}");
    if (response.statusCode == 200) {
      sharedPrefItems.remove("PopularItems");
      sharedPrefItems.save("PopularItems", response.body);
      return restaurantItemsListFromJson(response.body);
    } else {
      return restaurantItemsListFromJson("[]");
    }
  }

  Future<List<RestaurantProfileModel>>
      getPopularItemListsFromSharedPref() async {
    final response = await sharedPrefItems.read("PopularItems");
    print("From SharedPerfs");
    print(response);
    if (response != null) {
      return restaurantItemsListFromJson(response);
    } else {
      return null;
    }
  }

  Future<List<RestaurantProfileModel>> getDeliveryItemLists(String city) async {
    final end = "api/fliters/list/delivery/c/$city/";
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
    ).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        return null;
      },
    );
    print(url);
    print("response statusCode ---> ${response.statusCode}");
    print("response body ---> ${response.body}");
    if (response.statusCode == 200) {
      sharedPrefDelivery.remove("DeliveryItems");
      sharedPrefDelivery.save("DeliveryItems", response.body);
      return restaurantItemsListFromJson(response.body);
    } else {
      return restaurantItemsListFromJson("[]");
    }
  }

  Future<List<RestaurantProfileModel>>
      getDeliveryItemListsFromSharedPref() async {
    final response = await sharedPrefDelivery.read("DeliveryItems");
    print("From SharedPerfs");
    print(response);
    if (response != null) {
      return restaurantItemsListFromJson(response);
    } else {
      return null;
    }
  }

  Future<List<RestaurantProfileModel>> getTakeawayItemLists(String city) async {
    final end = "api/fliters/list/takeaway/c/$city/";
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
    ).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        return null;
      },
    );
    print(url);
    print("response statusCode ---> ${response.statusCode}");
    print("response body ---> ${response.body}");
    if (response.statusCode == 200) {
      sharedPrefTakeaway.remove("TakeawayItems");
      sharedPrefTakeaway.save("TakeawayItems", response.body);
      return restaurantItemsListFromJson(response.body);
    } else {
      return restaurantItemsListFromJson("[]");
    }
  }

  Future<List<RestaurantProfileModel>>
      getTakeawayItemListsFromSharedPref() async {
    final response = await sharedPrefTakeaway.read("TakeawayItems");
    print("From SharedPerfs");
    print(response);
    if (response != null) {
      return restaurantItemsListFromJson(response);
    } else {
      return null;
    }
  }

  Future<List<RestaurantProfileModel>> getDininItemLists(String city) async {
    final end = "api/fliters/list/dinin/c/$city/";
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
    ).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        return null;
      },
    );
    print(url);
    print("response statusCode ---> ${response.statusCode}");
    print("response body ---> ${response.body}");
    if (response.statusCode == 200) {
      sharedPrefDinin.remove("DininItems");
      sharedPrefDinin.save("DininItems", response.body);
      return restaurantItemsListFromJson(response.body);
    } else {
      return restaurantItemsListFromJson("[]");
    }
  }

  Future<List<RestaurantProfileModel>> getDininItemListsFromSharedPref() async {
    final response = await sharedPrefDinin.read("DininItems");
    print("From SharedPerfs");
    print(response);
    if (response != null) {
      return restaurantItemsListFromJson(response);
    } else {
      return null;
    }
  }

  Future<List<RestaurantProfileModel>> getScoreItemLists(String city) async {
    final end = "api/fliters/list/score/c/$city/";
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
    ).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        return null;
      },
    );
    print(url);
    print("response statusCode ---> ${response.statusCode}");
    print("response body ---> ${response.body}");
    if (response.statusCode == 200) {
      sharedPrefScore.remove("ScoreItems");
      sharedPrefScore.save("ScoreItems", response.body);
      return restaurantItemsListFromJson(response.body);
    } else {
      return restaurantItemsListFromJson("[]");
    }
  }

  Future<List<RestaurantProfileModel>> getScoreItemListsFromSharedPref() async {
    final response = await sharedPrefScore.read("ScoreItems");
    print("From SharedPerfs");
    print(response);
    if (response != null) {
      return restaurantItemsListFromJson(response);
    } else {
      return null;
    }
  }

  Future<List<RestaurantProfileModel>> getverifiedItemLists(String city) async {
    final end = "api/fliters/list/verified/c/$city/";
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
    ).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        return null;
      },
    );
    print(url);
    print("response statusCode ---> ${response.statusCode}");
    print("response body ---> ${response.body}");
    if (response.statusCode == 200) {
      sharedPrefVerified.remove("verifiedItems");
      sharedPrefVerified.save("verifiedItems", response.body);
      return restaurantItemsListFromJson(response.body);
    } else {
      return restaurantItemsListFromJson("[]");
    }
  }

  Future<List<RestaurantProfileModel>>
      getverifiedItemListsFromSharedPref() async {
    final response = await sharedPrefVerified.read("verifiedItems");
    print("From SharedPerfs");
    print(response);
    if (response != null) {
      return restaurantItemsListFromJson(response);
    } else {
      return null;
    }
  }

  Future<List<RestaurantProfileModel>> getpromoItemLists(String city) async {
    final end = "api/fliters/list/promo/c/$city/";
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
    ).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        return null;
      },
    );
    print(url);
    print("response statusCode ---> ${response.statusCode}");
    print("response body ---> ${response.body}");
    if (response.statusCode == 200) {
      sharedPrefPromo.remove("promoItems");
      sharedPrefPromo.save("promoItems", response.body);
      return restaurantItemsListFromJson(response.body);
    } else {
      return restaurantItemsListFromJson("[]");
    }
  }

  Future<List<RestaurantProfileModel>> getpromoItemListsFromSharedPref() async {
    final response = await sharedPrefPromo.read("promoItems");
    print("From SharedPerfs");
    print(response);
    if (response != null) {
      return restaurantItemsListFromJson(response);
    } else {
      return null;
    }
  }

  Future<List<RestaurantProfileModel>> getopenItemLists(String city) async {
    final end = "api/fliters/list/open/c/$city/";
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
    ).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        return null;
      },
    );
    print(url);
    print("response statusCode ---> ${response.statusCode}");
    print("response body ---> ${response.body}");
    if (response.statusCode == 200) {
      sharedPrefOpen.remove("openItems");
      sharedPrefOpen.save("openItems", response.body);
      return restaurantItemsListFromJson(response.body);
    } else {
      return restaurantItemsListFromJson("[]");
    }
  }

  Future<List<RestaurantProfileModel>> getopenItemListsFromSharedPref() async {
    final response = await sharedPrefOpen.read("openItems");
    print("From SharedPerfs");
    print(response);
    if (response != null) {
      return restaurantItemsListFromJson(response);
    } else {
      return null;
    }
  }
}
