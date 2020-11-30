import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_app/screens/auth/bloc/authentication_bloc.dart';
import 'package:food_app/screens/auth/repository/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  RegisterBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterInitial();

      try {
        final user = await userRepository.registerauthenticate(
          account: event.account,
          username: event.username,
          email: event.email,
          password1: event.password1,
          password2: event.password2,
        );
        authenticationBloc.add(Registred(user: user));
        yield RegisterInitial();
        yield RegisterSuccess();
      } catch (error) {
        yield RegisterFaliure(error: error.toString());
      }
    }
  }
}
