import 'package:flutter/cupertino.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int bottomNavigationState = 0;

  void changePage(int page) {
    print(page);
    bottomNavigationState = page;
    notifyListeners();
  }
}
