import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_29/firebase_options.dart';
import 'package:flutter_application_29/repo/user_reoasitory.dart';
import 'package:flutter_application_29/view/auth_bloc.dart';
import 'package:flutter_application_29/view/auth_event.dart';
import 'package:flutter_application_29/view/auth_wapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authrepo = FirebaseAuthrepository();

  runApp(
    BlocProvider(
      create: (_) => AuthBloc(repo: authrepo)..add(AuthStarted()),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthWapper());
  }
}
