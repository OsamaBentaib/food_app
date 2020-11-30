part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final int account;
  final String username;
  final String email;
  final String password1;
  final String password2;

  const RegisterButtonPressed(
      {@required this.account,
      @required this.username,
      @required this.email,
      @required this.password1,
      @required this.password2});

  @override
  List<Object> get props => [username, password1, password2, email];

  @override
  String toString() =>
      'RegisterButtonPressed { account: $account, username: $username, password: $password1, email: $email }';
}
