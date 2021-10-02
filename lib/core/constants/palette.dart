import 'package:flutter/material.dart';

class Palette {
  static Palette _instace = Palette._init();
  static Palette get instance => _instace;
  Palette._init();

  final Color appBarBlue = const Color(0xFF25c5f9);
}
