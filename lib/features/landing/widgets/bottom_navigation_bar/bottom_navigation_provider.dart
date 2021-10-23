import 'package:flutter/cupertino.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int bottomNavigationState = 0;

  void changePage(int page) {
    print(page);
    bottomNavigationState = page;
    notifyListeners();
    _reportBottomNavigaton(page);
  }

  void _reportBottomNavigaton(int index) {
    late final String buttonValue;
    if (index == 1) {
      buttonValue = 'profile';
    } else {
      buttonValue = 'home_page';
    }
  }
}
