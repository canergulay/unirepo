// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchMobx on _SearchMobx, Store {
  final _$universitiesAtom = Atom(name: '_SearchMobx.universities');

  @override
  List<University> get universities {
    _$universitiesAtom.reportRead();
    return super.universities;
  }

  @override
  set universities(List<University> value) {
    _$universitiesAtom.reportWrite(value, super.universities, () {
      super.universities = value;
    });
  }

  final _$getTallAsyncAction = AsyncAction('_SearchMobx.getTall');

  @override
  Future<void> getTall() {
    return _$getTallAsyncAction.run(() => super.getTall());
  }

  @override
  String toString() {
    return '''
universities: ${universities}
    ''';
  }
}
