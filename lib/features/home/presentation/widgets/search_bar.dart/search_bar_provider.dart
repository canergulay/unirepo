import 'package:flutter/material.dart';

class SearchBarProvider extends ChangeNotifier {
  final String _universityExp = 'Üniversitenizi belirtiniz';
  final String _courseExp = 'Ders kodunu belirtiniz';

  SearchBarState searchState = SearchBarState.university;

  void changePage() {
    if (searchState == SearchBarState.university) {
      searchState = SearchBarState.course;
    } else {
      searchState = SearchBarState.university;
    }

    notifyListeners();
  }

  Color? getColor(SearchBarState state, BuildContext context) {
    return Theme.of(context).appBarTheme.backgroundColor?.withOpacity(state == searchState ? 1 : 0.15);
  }

  String getSearchHint() {
    return searchState == SearchBarState.university ? _universityExp : _courseExp;
  }

  String getLabelString() {
    return searchState == SearchBarState.university ? 'Üniversite' : 'Ders Kodu';
  }

  TextStyle? getTextStyle(SearchBarState state, BuildContext context) {
    return state == searchState ? Theme.of(context).textTheme.headline6 : Theme.of(context).textTheme.bodyText1;
  }
}

enum SearchBarState { university, course }
