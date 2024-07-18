import 'package:cubit_counter/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({super.key, required this.title});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: emailController,
      style: const TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: "email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final passwordField = TextField(
      controller: passwordController,
      style: const TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: "password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = ElevatedButton(
        onPressed: () {
          // Navigator.of(context).pushNamed('/home');
          BlocProvider.of<AuthenticationBloc>(context).add(
              AuthenticateUser(emailController.text, passwordController.text));
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
        ));
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          Navigator.of(context).pushNamed("/home");
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              emailField,
              passwordField,
              loginButton,
            ],
          ),
        ),
      ),
    );
  }
}
