import 'package:firebase_auth/firebase_auth.dart';

class MyUser {
  final String id;

  MyUser({required this.id});

  factory MyUser.fromFirebase(User user) => MyUser(id: user.uid);
}
