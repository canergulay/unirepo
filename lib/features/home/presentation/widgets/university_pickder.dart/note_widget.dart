import 'package:flutter/material.dart';
import 'package:unirepo/core/components/decorations/simple_shadow_decoration.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/constants/palette.dart';
import 'package:unirepo/core/utils/date_formatter.dart';
import 'package:unirepo/features/home/data/models/note/note.dart';

Container noteContainer(Note note, BuildContext context) => Container(
      decoration: simpleShadowDecoration(context),
      margin: EdgeInsets.symmetric(
        horizontal: context.limitedwidthUnit * 2.31,
      ),
      child: noteWidget(note, context),
    );

ClipRRect noteWidget(Note note, BuildContext context) => ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          leftBar(context),
          noteContainerBody(context, note),
        ],
      ),
    );

Container leftBar(BuildContext context) {
  return Container(
    width: 10,
    height: containerHeightGetter(context),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryVariant,
    ),
  );
}

Expanded noteContainerBody(BuildContext context, Note note) {
  return Expanded(
    child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        padding: EdgeInsets.all(context.limitedheightUnit * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(note, context),
            explanationText(note),
            picturesRow(note, context),
            const SizedBox(height: 5),
            footer(note, context),
          ],
        )),
  );
}

Row footer(Note note, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 9,
        child: Text(
          '- ${note.user?.name}',
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 1,
        ),
      ),
      Expanded(
        flex: 2,
        child: Text(
          dateFormatter(note.created ?? DateTime(2021)),
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontStyle: FontStyle.italic,
              ),
        ),
      ),
    ],
  );
}

Row picturesRow(Note note, BuildContext context) {
  return Row(
    children: [
      for (var picture in note.documents ?? [])
        Container(
          decoration: simpleShadowDecoration(context),
          margin: const EdgeInsets.only(left: 5, top: 8),
          child: Image.network(
            picture,
            height: context.limitedheightUnit * 6,
          ),
        ),
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: getNumberOfNotesText(note, context),
      )
    ],
  );
}

Widget getNumberOfNotesText(Note note, BuildContext context) {
  late final int numberOfExtraNotes;
  if (note.numberOfNotes != null) {
    numberOfExtraNotes = note.numberOfNotes! - Palette.instance.documentShownSize;
  } else {
    numberOfExtraNotes = 15;
  }
  print(note.numberOfNotes);
  print(Palette.instance.documentShownSize);

  if (numberOfExtraNotes == 0) {
    return const SizedBox();
  }

  return Text(
    '+ $numberOfExtraNotes',
    style: Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 19,
        ),
  );
}

Text explanationText(Note note) => Text(
      note.explanation ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

Row titleText(Note note, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        note.title ?? '',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
            ),
      ),
      Text(
        '${note.coursePrefix?.prefix} ${note.courseCode}',
        style: Theme.of(context).textTheme.subtitle1,
      ),
    ],
  );
}

double containerHeightGetter(BuildContext context) {
  return context.limitedheightUnit * 18;
}
