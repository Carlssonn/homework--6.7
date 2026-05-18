import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_29/model/data/user_model.dart';

abstract class Authrepository {
  Stream<UserModel?> get authSateChange;
  Future<UserModel> signIn(String email, String passworld);
  Future<UserModel> signUp(String email, String passworld);
  Future<void> signOut();
  Future<String?> getToken();
}

class FirebaseAuthrepository implements Authrepository {
  final _auth = FirebaseAuth.instance;
  @override
  Stream<UserModel?> get authSateChange {
    return _auth.authStateChanges().map(
      (user) => user != null ? UserModel.fromFirebase(user) : null,
    );
  }

  @override
  Future<String?> getToken() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signIn(String email, String passworld) async {
    final cread = await _auth.signInWithEmailAndPassword(
      email: email,
      password: passworld,
    );
    return UserModel.fromFirebase(cread.user!);
  }

  @override
  Future<void> signOut() => _auth.signOut();

  @override
  Future<UserModel> signUp(String email, String pasword) async {
    final cread = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: pasword,
    );
    return UserModel.fromFirebase(cread.user!);
  }
}
