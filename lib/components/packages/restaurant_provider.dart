import 'package:food_app/screens/app/restaurant/local/models/restaurant_model.dart';
import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class RestaurantDatabaseProvider {
  RestaurantDatabaseProvider._();

  static final RestaurantDatabaseProvider db = RestaurantDatabaseProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "restaurant.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Restaurant ("
          "id INTEGER PRIMARY KEY, "
          "added_by INTEGER, "
          "name TEXT, "
          "address TEXT, "
          "bio TEXT, "
          "phone TEXT, "
          "website TEXT, "
          "categorie TEXT, "
          "avatar TEXT ,"
          "city TEXT, "
          "country TEXT, "
          "service TEXT "
          ")");
    });
  }

  addrestaurantToDatabase(RestaurantForDB restaurant) async {
    final db = await database;
    var raw = await db.insert(
      "Restaurant",
      restaurant.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  updaterestaurant(RestaurantForDB restaurant) async {
    final db = await database;
    var response = await db.update("Restaurant", restaurant.toMap(),
        where: "id = ?", whereArgs: [restaurant.id]);
    return response;
  }

  Future<RestaurantForDB> getrestaurantWithId() async {
    final db = await database;
    var response = await db.query("Restaurant");
    return response.isNotEmpty ? RestaurantForDB.fromMap(response.first) : null;
  }

  Future<List<RestaurantForDB>> getAllrestaurants() async {
    final db = await database;
    var response = await db.query("Restaurant");
    List<RestaurantForDB> list =
        response.map((c) => RestaurantForDB.fromMap(c)).toList();
    return list;
  }

  deleteAllRestaurant() async {
    final db = await database;
    db.delete("Restaurant");
  }
}
