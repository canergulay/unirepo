import 'package:flutter/material.dart';

InkWell basicTextInkWell(
  BuildContext context, {
  required String text,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Text(
      text,
      style: Theme.of(context).textTheme.bodyText1,
    ),
  );
}
