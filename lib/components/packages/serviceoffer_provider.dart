import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ServiceDatabaseProvider {
  ServiceDatabaseProvider._();

  static final ServiceDatabaseProvider db = ServiceDatabaseProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Services.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Services ("
          "id INTEGER PRIMARY KEY, "
          "rst_id INTEGER, "
          "isDelivery INTEGER, "
          "isTakeaway INTEGER, "
          "isNcDelivery INTEGER, "
          "isDinIn INTEGER "
          ")");
    });
  }

  addServiceofferToDatabase(ServiceOfferToInt serviceOffer) async {
    final db = await database;
    var raw = await db.insert(
      "Services",
      serviceOffer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  Future<ServiceOfferToInt> getServiceoffer() async {
    final db = await database;
    var response = await db.query("Services");
    return response.isNotEmpty
        ? ServiceOfferToInt.fromMap(response.first)
        : null;
  }

  deleteServiceoffer() async {
    final db = await database;
    db.delete("Services");
  }
}
