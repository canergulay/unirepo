import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';

Padding registerInfoTitle(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: context.limitedwidthUnit * 2,
      vertical: context.limitedheightUnit * 1,
    ),
    child: Text(
      SentenceRepositary.shared.shouldHaveAnAccount,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.subtitle2,
    ),
  );
}
