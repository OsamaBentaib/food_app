part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUnintialized extends AuthenticationState {}

class AuthenticationAuthenticatedAsPerson extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationAuthenticatedAsRestaurant extends AuthenticationState {}

class AuthenticationAuthenticatedLoginAsPerson extends AuthenticationState {
  
}

class AuthenticationAuthenticatedLoginAsRestaurant extends AuthenticationState {
}

class AuthenticationAuthenticatedRegisterAsPerson extends AuthenticationState {}
class AuthenticationAuthenticatedRegisterAsRestaurant extends AuthenticationState {}
class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
