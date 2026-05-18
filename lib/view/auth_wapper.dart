import 'package:flutter/material.dart';
import 'package:flutter_application_29/view/auth_bloc.dart';
import 'package:flutter_application_29/view/auth_state.dart';
import 'package:flutter_application_29/view/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthWapper extends StatelessWidget {
  const AuthWapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, State) {
        if (State is AuthInitial || State is AuthLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (State is AuthAuthenticated) {
          return Scaffold(body: Center(child: Text('Home page')));
        }
        return LoginPage();
      },
    );
  }
}
