import 'package:flutter/material.dart';
import 'package:unirepo/core/constants/app_constants.dart';
import 'package:unirepo/core/local_manager/hive_manager.dart';
import 'package:unirepo/features/home/data/models/university.dart';

class SearchBarProvider extends ChangeNotifier {
  bool isUniversityPicked = false;
  late final University universityPicked;
  SearchBarProvider() {
    doHavePickedUniversity();
  }

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

  Future<void> doHavePickedUniversity() async {
    await HiveManager.instance.openBox(boxName: AppConstants.shared.hivePickedUniversityBox);
    final String? universityCachedName = await HiveManager.instance.get(
      boxName: AppConstants.shared.hivePickedUniversityBox,
      key: AppConstants.shared.hivePickedUniversityNameKey,
    );
    if (universityCachedName == null) {
      // MEANING THAT THERE IS NOT A UNIVERSITY THAT IS CACHED AS A PICKED UNIVERSITY
    } else {
      final int? universityCachedId = await HiveManager.instance.get(
        boxName: AppConstants.shared.hivePickedUniversityBox,
        key: AppConstants.shared.hivePickedUniversityidKey,
      );
      // OUR HUSE HAS A PICKED UNIVERSITY CACHED, SO WE SHOULD CONTINUE WITH IT.
      _activatePickedUniversity(University(
        id: universityCachedId,
        name: universityCachedName,
      ));
    }
  }

  void _activatePickedUniversity(University university) {
    universityPicked = university;
    isUniversityPicked = true;
    notifyListeners();
  }

  Future<void> pickUniversity(University university, BuildContext context) async {
    await HiveManager.instance.pickUniversity(university);
    _activatePickedUniversity(university);
    FocusScope.of(context).unfocus();
    // _activatePickedUniversity(university);
  }
}

enum SearchBarState { university, course }
