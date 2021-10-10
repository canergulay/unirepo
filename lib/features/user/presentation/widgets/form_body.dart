import 'package:flutter/material.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';

Padding formBody(BuildContext context, {required List<Widget> children}) {
  return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.limitedheightUnit * 1,
        horizontal: context.limitedwidthUnit * 4,
      ),
      child: Column(
        children: children,
      ));
}
