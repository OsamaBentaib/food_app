class User {
  int id;
  String username;
  String token;
  int account;

  User({this.id, this.username, this.token, this.account});

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
        id: data['id'],
        username: data['username'],
        token: data['token'],
        account: data['account'],
      );

  Map<String, dynamic> toDatabaseJson() =>
      {"id": this.id, "username": this.username, "token": this.token, "account": this.account};
}
