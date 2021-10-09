import 'package:flutter/material.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';

ElevatedButton classicElevatedButton(
  BuildContext context, {
  required VoidCallback onPressed,
  required String title,
}) {
  return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondaryVariant),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: context.limitedwidthUnit * 5, vertical: context.limitedheightUnit * 1.5),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ));
}
