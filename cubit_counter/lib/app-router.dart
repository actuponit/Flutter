import 'package:cubit_counter/bloc/authentication_bloc.dart';
import 'package:cubit_counter/cubit/counterCubit.dart';
import 'package:cubit_counter/presentation/home_page.dart';
import 'package:cubit_counter/presentation/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      AuthenticationBloc()..add(AuthenticationStarted()),
                  child: const LoginPage(
                    title: "Login Screen",
                  ),
                ));
      case '/home':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CounterBloc(),
                  child: const MyHomePage(title: "Home screen"),
                ));
      default:
        return null;
    }
  }
}
