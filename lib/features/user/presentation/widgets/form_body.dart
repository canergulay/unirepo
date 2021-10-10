import 'package:flutter/material.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';

Padding formBody(BuildContext context, {required Widget child}) {
  return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.limitedheightUnit * 1,
        horizontal: context.limitedwidthUnit * 4,
      ),
      child: child);
}
