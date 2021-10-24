import 'package:flutter/cupertino.dart';

class NavigationTrigger {
  static var shared = NavigationTrigger();
  void push(BuildContext context, {required String path, Object? args}) {
    Navigator.of(context).pushNamed(path, arguments: args);
  }
}
