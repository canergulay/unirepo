import 'package:flutter/material.dart';
import 'package:unirepo/features/home/presentation/pages/home_screen.dart';
import 'package:unirepo/features/user/presentation/pages/user_screen.dart';

class AppScreens {
  static List<Widget> call() {
    return [HomeScreen(), UserScreen()];
  }
}
