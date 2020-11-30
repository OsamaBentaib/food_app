part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFaliure extends RegisterState {
  final String error;

  const RegisterFaliure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => ' RegisterFaliure { error: $error }';
}
