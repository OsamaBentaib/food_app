import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_app/screens/auth/bloc/authentication_bloc.dart';
import 'package:food_app/screens/auth/repository/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginInitial();

      try {
        final user = await userRepository.loginauthenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(user: user));
        yield LoginInitial();
      } catch (error) {
        yield LoginFaliure(error: error.toString());
      }
    }
  }
}
