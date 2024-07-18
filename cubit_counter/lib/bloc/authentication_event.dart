part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticateUser extends AuthenticationEvent {
  final String email;
  final String password;
  AuthenticateUser(this.email, this.password);
}

class AuthenticationSignedOut extends AuthenticationEvent {}
