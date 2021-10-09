import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:unirepo/core/freezed/authentication_state/authentication_state.dart';

class AuthenticationProvider extends ChangeNotifier {
  AuthenticationState authenticationState = AuthenticationState.unauthenticated();
  final _firebaseAuth = FirebaseAuth.instance;
  AuthenticationProvider() {
    // SOME CACHE CONTROLS, WE WILL CHECK IF OUR USER HAS LOGGED IN BEFORE, HAS A VALID TOKEN OR NOT
    // FOR NOW WE WILL DEEM IT FALSE
    _listenState();
  }

  void _listenState() {
    _firebaseAuth.authStateChanges().listen(userStatusChanged);
  }

  Future<void> userStatusChanged(User? user) async {
    if (user != null) {
      if (user.emailVerified) {
        _authenticateUser(user);
      } else {
        await user.sendEmailVerification();
        authenticationState = AuthenticationState.needsverification(user);
        _checkIfUserVerified();
      }
    }
    notifyListeners();
  }

  void _authenticateUser(User? user) {
    if (user != null) {
      authenticationState = AuthenticationState.authenticated(user);
    }
  }

  void _checkIfUserVerified() {
    Timer.periodic(const Duration(seconds: 10), _checkIfUserIsVerified);
  }

  Future<void> _checkIfUserIsVerified(Timer timer) async {
    // FIREBASE DOES NOT SUPPORT LISTENING AN EVENT OF EMAIL VERIFICATION IN ITS CORE
    // SO I HAD TO COME UP WITH SUCH A SOLUTION,
    // IF USER LOGS IN, AND IF HIS/HER ACCOUNT IS NOT VERIFED BY EMAIL
    // I WILL START TRIGGERING COMMANDS BELOW IN A PERIODIC MANNER.
    // NAMELY, EVERY 10 SECONDS.
    final User? user = _firebaseAuth.currentUser;
    if (user != null) {
      await user.reload();
      if (user.emailVerified) {
        _authenticateUser(user);
        timer.cancel(); // IT WILL STOP THIS PERIODIC TIMER, ONCE IT DETECTS USER IS VERIFIED
        notifyListeners();
      }
    }
  }
}
