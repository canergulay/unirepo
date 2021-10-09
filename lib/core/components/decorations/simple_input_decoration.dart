import 'package:flutter/material.dart';
import 'package:unirepo/core/constants/palette.dart';

InputDecoration basicBlankInputDecoration(
  BuildContext context, {
  required String hint,
}) {
  return InputDecoration(
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(Palette.instance.borderRadiusGeneral),
      ),
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      contentPadding: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black45),
      hintText: hint);
}
