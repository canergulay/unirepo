import 'package:flutter/material.dart';

BoxDecoration simpleShadowDecoration(BuildContext context) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
    boxShadow: [
      BoxShadow(
        blurRadius: 10,
        spreadRadius: 1,
        color: Colors.black.withAlpha(30),
      )
    ],
  );
}
