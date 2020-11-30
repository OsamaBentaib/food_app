import 'dart:async';
import 'package:food_app/screens/auth/model/user_model.dart';
import 'package:meta/meta.dart';
import 'package:food_app/screens/auth/model/api_model.dart';
import 'package:food_app/screens/auth/api_connection/api_connection.dart';
import 'package:food_app/screens/auth/api_connection/login_api_connection.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';

class UserRepository {
  final userDao = UserDao();

  Future<User> registerauthenticate({
    @required String username,
    @required String email,
    @required String password1,
    @required String password2,
    @required int account,
  }) async {
    UserRegister userRegister = UserRegister(
        username: username,
        email: email,
        password1: password1,
        password2: password2,
        account: account);
    Token token = await getregisterToken(userRegister);
    print(token.token);
    AccountType accountType = await createAccountType(account, token.token);
    print(accountType.account);
    User user = User(
      id: 0,
      username: username,
      token: token.token,
      account: accountType.account,
    );
    return user;
  }

  Future<User> loginauthenticate({
    @required String username,
    @required String password,
  }) async {
    UserLogin userLogin = UserLogin(username: username, password: password);
    Token token = await getloginToken(userLogin);

    final userToken = token.token;
    print("Token $userToken");
    Account account = await getAccountToken(userToken);
    User user = User(
      id: 0,
      username: username,
      token: token.token,
      account: account.account,
    );
    return user;
  }

  Future<void> persistToken({@required User user}) async {
    // write token with the user to the database
    final create = await userDao.createUser(user);
    print(create);
  }

  Future<void> delteToken({@required int id}) async {
    await userDao.deleteUser(id);
  }

  Future<bool> hasToken() async {
    bool result = await userDao.checkUser(0);
    return result;
  }

  Future<bool> accountType() async {
    bool result = await userDao.checkAccount();
    return result;
  }
}
