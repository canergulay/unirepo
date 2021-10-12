import 'package:flutter/cupertino.dart';
import 'package:unirepo/core/reporter/report_manager.dart';

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
    ReportManager.instance.logBottomNavbarEventCollective(data: {'pressed_button': buttonValue});
  }
}
