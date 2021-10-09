import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoggedIn = false;
  final firebaseAuth = FirebaseAuth.instance;
  AuthenticationProvider() {
    // SOME CACHE CONTROLS, WE WILL CHECK IF OUR USER HAS LOGGED IN BEFORE, HAS A VALID TOKEN OR NOT
    // FOR NOW WE WILL DEEM IT FALSE
    _listenState();
  }

  void _listenState() {
    firebaseAuth.authStateChanges().listen((User? user) {
      print('geldi');
      print(user);
    });
  }
}
