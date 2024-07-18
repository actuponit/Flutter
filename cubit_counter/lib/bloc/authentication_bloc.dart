import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>(mapEventToState);
  }

  void mapEventToState(event, emit) async {
    // TODO: implement event handler
    if (event is AuthenticationStarted) {
      User? user = await Auth().authStateChange;
      if (user == null) {
        print("No user");
        emit(AuthenticationFailure());
      } else {
        print(user.email);
        emit(AuthenticationSuccess(user.email!));
      }
    } else if (event is AuthenticateUser) {
      UserCredential? uc =
          await Auth().signIn(email: event.email, password: event.password);
      if (uc != null) {
        print(uc);
        emit(AuthenticationSuccess(uc.user!.email!));
      } else {
        print("Login Failed");
        emit(AuthenticationFailure());
      }
    }
  }
}
