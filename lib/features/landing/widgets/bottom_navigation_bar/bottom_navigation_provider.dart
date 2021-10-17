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
<<<<<<< HEAD:lib/features/landing/widgets/bottom_navigation_bar/bottom_navigation_provider.dart
=======
    ReportManager.instance.logBottomNavbarEventCollective(data: {'pressed_button': buttonValue});
>>>>>>> parent of 4d0ebbd... info added:lib/features/landing/widgets/bottom_navigation_bar/bototm_navigation_provider.dart
  }
}
