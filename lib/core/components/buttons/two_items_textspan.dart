import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';

RichText twoItemsTextSpan(
  BuildContext context, {
  required String firstSection,
  required String secondSection,
  required VoidCallback onPressed,
}) {
  return RichText(
    text: TextSpan(
      text: firstSection,
      style: Theme.of(context).textTheme.bodyText1,
      children: [
        TextSpan(
          text: secondSection,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          recognizer: TapGestureRecognizer()..onTap = onPressed,
        )
      ],
    ),
  );
}
