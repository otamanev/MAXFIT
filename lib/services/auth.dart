import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/domain/myuser.dart';
import 'package:flutter_application_2/exceptions/user_not_exists.dart';

class AuthServise {
  Future<MyUser> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    if (user == null) {
      throw UserNotExistsException(email);
    }

    return MyUser.fromFirebase(user);
  }

  Future<MyUser> registerWithEmailAndPassword(
      String email, String password) async {
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    if (user == null) {
      throw UserNotExistsException(email);
    }

    return MyUser.fromFirebase(user);
  }

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  /*Stream<MyUser> get currentUser {
    return _fAuth.onauthStateChanges
    .map((FirebaseUser user) => user != null ? User.fromFirebase(user) : null);
  }

  Stream<MyUser> get currentUser {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

}

*/
}

AuthServise fbAuth = AuthServise();
