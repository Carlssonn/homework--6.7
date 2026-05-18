import 'package:flutter/material.dart';
import 'package:flutter_application_29/view/auth_bloc.dart';
import 'package:flutter_application_29/view/auth_event.dart';
import 'package:flutter_application_29/view/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailctrl = TextEditingController();
  final _passctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              TextField(
                controller: _emailctrl,
                decoration: InputDecoration(labelText: 'emaqil'),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _passctrl,
                decoration: InputDecoration(labelText: 'password'),
              ),
              SizedBox(height: 24),

              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is AuthLoading
                        ? null
                        : () => context.read()<AuthBloc>().add(
                            AuthSignUpRequested(
                              _emailctrl.text,
                              _passctrl.text,
                            ),
                          ),

                    child: state is AuthLoading
                        ? CircularProgressIndicator()
                        : Text('open'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
