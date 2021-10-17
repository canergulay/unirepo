import 'package:flutter/cupertino.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int bottomNavigationState = 0;

  void changePage(int page) {
    bottomNavigationState = page;
    notifyListeners();
    _reportBottomNavigaton(page);
  }

  void _reportBottomNavigaton(int index) {
    // HERE WE ARE LOGGING WHAT BOTTOM NAVIGATION BAR BUTTON USER PRESSES
    // EITHER PROFILE, OR HOMEPAGE.
    // WE CAN TRACK THIS DATA HERE
    late final String buttonValue;
    if (index == 1) {
      buttonValue = 'profile';
    } else {
      buttonValue = 'home_page';
    }
  }
}
