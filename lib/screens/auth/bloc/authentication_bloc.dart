import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:food_app/screens/auth/repository/user_repository.dart';
import 'package:food_app/screens/auth/model/user_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(UserRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUnintialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();
      final bool isrestr = await userRepository.accountType();
      if (hasToken) {
        if (isrestr) {
          yield AuthenticationAuthenticatedAsRestaurant();
        } else {
          yield AuthenticationAuthenticatedAsPerson();
        }
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(user: event.user);
      if (event.user.account == 0) {
        yield AuthenticationAuthenticatedLoginAsPerson();
      } else if (event.user.account == 1) {
        yield AuthenticationAuthenticatedLoginAsRestaurant();
      }
    }
    if (event is Registred) {
      yield AuthenticationLoading();
      await userRepository.persistToken(user: event.user);
      if (event.user.account == 0) {
        yield AuthenticationAuthenticatedRegisterAsPerson();
        
            
      } else if (event.user.account == 1) {
        yield AuthenticationAuthenticatedRegisterAsRestaurant();
      }
    }
    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.delteToken(id: 0);
      yield AuthenticationUnauthenticated();
    }
  }
}
