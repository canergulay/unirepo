import 'package:flutter/material.dart';
import 'package:unirepo/core/components/buttons/animator_button.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/constants/palette.dart';

class OkCancelDialog extends Dialog {
  // THIS IS A COMMON BEST PRACTICE TO CREATE DIALOG CLASSES SEPERATELY,
  // WE ALSO HAVE A NON-COMPLICATED DIALOG MANAGER THAT WE USE TO SHOW DIALOGS

  final Function(bool) result;
  final String title;
  final String explanation;
  final BuildContext context;
  OkCancelDialog({
    required this.title,
    required this.explanation,
    required this.context,
    required this.result,
  }) : super(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Palette.instance.borderRadiusGeneral)),
          elevation: 0,
          child: dialogBody(context, title: title, explanation: explanation, result: result),
        );
}

Container dialogBody(BuildContext context, {required String title, required String explanation, required Function(bool) result}) {
  return Container(
    padding: EdgeInsets.only(
      top: context.mediumPadding,
      bottom: context.mediumPadding / 2,
      right: context.mediumPadding,
      left: context.mediumPadding,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: context.heightUnit),
        Text(explanation, textAlign: TextAlign.center),
        SizedBox(height: context.heightUnit),
        Divider(),
        SizedBox(height: context.heightUnit),
        okCancelButtons(context, result: result),
      ],
    ),
  );
}

Row okCancelButtons(BuildContext context, {required Function(bool) result}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      okCancelButton(context, isOkButton: false, result: result),
      SizedBox(
        width: context.widthUnit * 2,
      ),
      okCancelButton(context, isOkButton: true, result: result),
    ],
  );
}

AnimatorButton okCancelButton(
  BuildContext context, {
  required bool isOkButton,
  required Function(bool) result,
}) {
  return AnimatorButton(
    upperBound: 0.25,
    onPressed: () {
      result(isOkButton);
    },
    childToBeAnimated: Text(
      isOkButton ? 'Tamam' : 'Vazgeç',
      style: Theme.of(context).textTheme.headline6?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.headline6?.color?.withOpacity(
                isOkButton ? 1 : 0.5,
              )),
    ),
  );
}
