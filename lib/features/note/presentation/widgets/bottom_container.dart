import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:unirepo/core/components/buttons/animator_button.dart';
import 'package:unirepo/core/components/decorations/simple_shadow_decoration.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/sentence_repositary.dart';
import 'package:unirepo/features/home/data/models/note/note.dart';

Stack bottomContainer(BuildContext context, Note note) {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: context.limitedwidthUnit * 2),
        decoration: _simpleDecoration(),
        child: Column(
          children: [
            SizedBox(height: context.limitedheightUnit * 3),
            titleText(note, context),
            SizedBox(height: context.limitedheightUnit),
            explanation(note),
            SizedBox(height: context.limitedheightUnit * 2),
            sharedBy(context, note),
            SizedBox(height: context.limitedheightUnit * 3),
            noteInfoRow(context, note),
            SizedBox(height: context.limitedheightUnit * 3),
            activateButton(context),
            SizedBox(height: context.limitedheightUnit * 5),
          ],
        ),
      ),
      dayAgoText(note, context),
    ],
  );
}

Positioned dayAgoText(Note note, BuildContext context) {
  return Positioned(
    child: Text(
      getDaysAgo(note.created).toString() + ' gün',
    ),
    right: context.limitedwidthUnit * 5.5,
    top: context.limitedheightUnit * 2,
  );
}

Row sharedBy(BuildContext context, Note note) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: context.limitedwidthUnit,
      ),
      Text(
        note.user?.name ?? '',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontStyle: FontStyle.italic,
            ),
      ),
      Text(SentenceRepositary.shared.sharedBy)
    ],
  );
}

int getDaysAgo(DateTime? date) {
  Duration? difference = DateTime.now().difference(date ?? DateTime.now());
  if (difference != null) {
    return difference.inDays;
  }
  return 10;
}

AnimatorButton activateButton(BuildContext context) {
  return AnimatorButton(
    onPressed: () {},
    upperBound: 0.3,
    childToBeAnimated: Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.limitedheightUnit * 3,
        vertical: context.limitedheightUnit * 1.5,
      ),
      child: Text(
        SentenceRepositary.shared.activate,
        style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.w500),
      ),
      decoration: simpleShadowDecoration(context, color: Theme.of(context).colorScheme.secondary),
    ),
  );
}

Row noteInfoRow(BuildContext context, Note note) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        AssetPaths.instance.pages,
        height: context.limitedheightUnit * 4,
      ),
      SizedBox(width: context.limitedwidthUnit * 2),
      Text(
        '${note.numberOfNotes} sayfa not',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(),
      )
    ],
  );
}

Text explanation(Note note) {
  return Text(
    note.explanation ?? '',
    textAlign: TextAlign.center,
  );
}

AutoSizeText titleText(Note note, BuildContext context) {
  return AutoSizeText(
    note.title ?? '',
    style: Theme.of(context).textTheme.headline6?.copyWith(
          fontWeight: FontWeight.w600,
        ),
    maxLines: 1,
  );
}

BoxDecoration _simpleDecoration() {
  return BoxDecoration(
    boxShadow: [BoxShadow(blurRadius: 7, spreadRadius: 2, color: Colors.black.withAlpha(10))],
    color: const Color(0xFFfafafa),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(50),
      topRight: Radius.circular(
        50,
      ),
    ),
  );
}
