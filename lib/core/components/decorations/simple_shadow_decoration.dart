import 'package:flutter/material.dart';

BoxDecoration simpleShadowDecoration(BuildContext context, {Color? color}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    color: color == null ? Theme.of(context).bottomNavigationBarTheme.backgroundColor : color,
    boxShadow: [
      BoxShadow(
        blurRadius: 10,
        spreadRadius: 1,
        color: Colors.black.withAlpha(30),
      )
    ],
  );
}
