import 'package:flutter/material.dart';

class Palette {
  static Palette _instace = Palette._init();
  static Palette get instance => _instace;
  Palette._init();

  final Color appBarBlue = const Color(0xFF25c5f9);
  final int documentShownSize = 6;
  final double borderRadiusGeneral = 12;

  final Color TOASTGREENLIGHT = Color(0xFFc5f7dd);
  final Color TOASTGREENDARK = Color(0xFF3bc279);

  final Color TOASTREDLIGHT = Color(0xFFffd0cb);
  final Color TOASTREDDARK = Color(0xFFe8594e);

  final Color TOASTBLUELIGHT = Color(0xFFcce3ff);
  final Color TOASTBLUEDARK = Color(0xFF3e85e3);
}
