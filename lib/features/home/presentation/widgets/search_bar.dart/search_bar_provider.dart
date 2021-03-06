import 'package:flutter/material.dart';
import 'package:unirepo/core/components/dialogs/ok_cancel_dialog.dart';
import 'package:unirepo/core/constants/app_constants.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';
import 'package:unirepo/core/freezed/fetch_state/fetch_state.dart';
import 'package:unirepo/core/freezed/result/result.dart';
import 'package:unirepo/core/local_manager/hive_manager.dart';
import 'package:unirepo/features/home/data/models/course_prefix/course_prefix.dart';
import 'package:unirepo/features/home/data/models/course_prefix/course_prefix_result.dart';
import 'package:unirepo/features/note/data/models/note/note.dart';
import 'package:unirepo/features/home/data/models/university/university.dart';
import 'package:unirepo/features/home/domain/usecases/get_notes.dart';
import 'package:unirepo/features/home/domain/usecases/get_supported_prefices.dart';

class SearchBarProvider extends ChangeNotifier {
  CoursePrefixState coursePrefixState = CoursePrefixState.loading();
  FetchState<List<Note>, Exception> noteState = FetchState.loading();

  final GetSupportedPrefices getSupportedPrefices;
  final GetNotes getNotes;
  bool isUniversityPicked = false;
  University universityPicked = University();
  SearchBarProvider({
    required this.getSupportedPrefices,
    required this.getNotes,
  }) {
    doHavePickedUniversity();
  }

  final String _universityExp = '√úniversitenizi belirtiniz';
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
    return searchState == SearchBarState.university ? '√úniversite' : 'Ders Kodu';
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
      final String? universityCachedId = await HiveManager.instance.get(
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

  Future<void> _activatePickedUniversity(University university) async {
    universityPicked = university;
    isUniversityPicked = true;
    await _fetchSupportedCoursePrefices(university.id);
    await _getInitialNotes(university.id);
    notifyListeners();
  }

  Future<void> pickUniversity(University university, BuildContext context) async {
    await HiveManager.instance.pickUniversity(university);
    _activatePickedUniversity(university);
    FocusScope.of(context).unfocus();
    // _activatePickedUniversity(university);
  }

  Future<void> _fetchSupportedCoursePrefices(String? universityPicked) async {
    final Result<List<CoursePrefix>, Exception> result = await getSupportedPrefices(universityPicked ?? '');
    result.when(success: (List<CoursePrefix> coursePrefices) {
      coursePrefixState = CoursePrefixState.loaded(
        coursePrefices..insert(0, const CoursePrefix(id: 'all', prefix: 'T√ľm√ľ')),
      );
    }, error: (Exception e) {
      coursePrefixState = CoursePrefixState.error(e.toString());
    });
  }

  Future<void> _getInitialNotes(String? universityPicked) async {
    final Result<List<Note>, Exception> result = await getNotes(universityID: universityPicked ?? '');
    result.when(success: (List<Note> notes) {
      noteState = FetchState.loaded(notes);
    }, error: (Exception e) {
      noteState = FetchState.error(e);
    });
  }

  Future<void> onSearchBarTapped(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return OkCancelDialog(
              title: SentenceRepositary.shared.uniContainerDialogTitle,
              explanation: SentenceRepositary.shared.uniContainerDialogExplanation,
              context: context,
              result: (bool isOk) {
                Navigator.of(context).pop();
                if (isOk) {
                  isUniversityPicked = false;
                  notifyListeners();
                }
              });
        });
  }

  Future<void> getNotesByPrefix(String prefixID) async {
    noteState = FetchState.loading();
    notifyListeners();

    if (prefixID != 'all') {
      final Result<List<Note>, Exception> result = await getNotes.getNotesByPrefix(
        universityID: universityPicked.id ?? '',
        prefixID: prefixID,
      );

      result.when(
          success: (List<Note> notess) {
            noteState = FetchState.loaded(notess);
          },
          error: (Exception e) {});
    } else {
      await _getInitialNotes(universityPicked.id);
    }
    notifyListeners();
  }
}

enum SearchBarState { university, course }
