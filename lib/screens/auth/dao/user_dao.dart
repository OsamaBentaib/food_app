import 'package:food_app/screens/auth/database/user_database.dart';
import 'package:food_app/screens/auth/model/user_model.dart';

class UserDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createUser(User user) async {
    final db = await dbProvider.database;
    var result = db.insert(userTable, user.toDatabaseJson());
    return result;
  }

  Future<int> deleteUser(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(userTable, where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<bool> checkUser(int id) async {
    final db = await dbProvider.database;
    try {
      List<Map> users =
          await db.query(userTable, where: 'id = ?', whereArgs: [id]);
      if (users.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
  Future<User> getUserWithId(int id) async {
    final db = await dbProvider.database;
    var response = await db.query(userTable, where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? User.fromDatabaseJson(response.first) : null;
  }
  Future<bool> checkAccount() async {
    final db = await dbProvider.database;
    try {
      List<Map> users = await db.query(
        userTable,
        where: 'account = ?',
        whereArgs: [1],
      );
      if (users.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return error;
    }
  }
  // Future<User> getUser(int id) async {
  //   final db = await dbProvider.database;
  //   final res = await db.rawQuery("SELECT * FROM $userTable");

  //   List<User> list =
  //       res.isNotEmpty ? res.map((c) => User.fromJson(c)).toList() : [];

  //   return list;
  // }
}
