import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NotesPageViewProvider extends ChangeNotifier {
  int sliderState = 4;
  void updateSlider(int index) {
    print('printed');
    sliderState = index;
    notifyListeners();
  }
}
