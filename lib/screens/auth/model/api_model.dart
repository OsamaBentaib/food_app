class UserRegister {
  String username;
  String email;
  String password1;
  String password2;
  int account;

  UserRegister(
      {this.username,
      this.password1,
      this.email,
      this.password2,
      this.account});

  Map<String, dynamic> toDatabaseJson() => {
        "account": this.account,
        "username": this.username,
        "email": this.email,
        "password1": this.password1,
        "password2": this.password2
      };
}

class UserLogin {
  String username;
  String password;

  UserLogin({this.username, this.password});

  Map<String, dynamic> toDatabaseJson() =>
      {"username": this.username, "password": this.password};
}

class Token {
  String token;

  Token({this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json['key']);
  }
}

class Account {
  int account;

  Account({this.account});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(account: json['account']);
  }
}

class AccountType {
  final int id;
  final int account;

  AccountType({this.id, this.account});

  factory AccountType.fromJson(Map<String, dynamic> json) {
    return AccountType(
      id: json['id'],
      account: json['account'],
    );
  }
}
