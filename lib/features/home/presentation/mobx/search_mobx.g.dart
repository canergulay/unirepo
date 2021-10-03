// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchMobx on _SearchMobx, Store {
  final _$_universitiesAtom = Atom(name: '_SearchMobx._universities');

  @override
  List<University> get _universities {
    _$_universitiesAtom.reportRead();
    return super._universities;
  }

  @override
  set _universities(List<University> value) {
    _$_universitiesAtom.reportWrite(value, super._universities, () {
      super._universities = value;
    });
  }

  final _$triggerFetchingAsyncAction =
      AsyncAction('_SearchMobx.triggerFetching');

  @override
  Future<void> triggerFetching(String query) {
    return _$triggerFetchingAsyncAction.run(() => super.triggerFetching(query));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
