import 'package:firebase_auth/firebase_auth.dart';

class UserModel {

  final String uid;
  final String? email;
  final String? displayName;

  UserModel({
    required this.uid,
    this.email,
    this.displayName
  });

  factory UserModel.fromFirebase(User user){
    return UserModel(uid: user.uid,
    email: user.email,
    displayName: user.displayName,
    );
  }
}