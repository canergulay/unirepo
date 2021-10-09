import 'package:flutter/cupertino.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoggedIn = false;
  AuthenticationProvider() {
    // SOME CACHE CONTROLS, WE WILL CHECK IF OUR USER HAS LOGGED IN BEFORE, HAS A VALID TOKEN OR NOT
    // FOR NOW WE WILL DEEM IT FALSE
    isLoggedIn = false;
  }
}
