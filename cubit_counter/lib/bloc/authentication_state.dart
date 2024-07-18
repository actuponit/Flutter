part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final String email;
  AuthenticationSuccess(this.email);
}
