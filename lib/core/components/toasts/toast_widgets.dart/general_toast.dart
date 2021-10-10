import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:unirepo/core/components/buttons/animator_button.dart';
import 'package:unirepo/core/components/extensions/context_extension.dart';
import 'package:unirepo/core/components/extensions/sized_box_extension.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/constants/palette.dart';

import 'package:unirepo/core/utils/enums/toast_type_enum.dart';

class GeneralToast extends StatelessWidget {
  final ToastType type;
  final String title;
  final String message;
  const GeneralToast({
    required this.title,
    required this.message,
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.heightUnit * 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leftBar(context, type: type),
          toastBody(context, type: type, title: title, message: message),
        ],
      ),
    );
  }

  Container leftBar(BuildContext context, {required ToastType type}) {
    return Container(
      width: 10,
      height: context.heightUnit * 8,
      decoration: BoxDecoration(
          color: toastBarColorGetter(type),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          )),
    );
  }
}

Container toastBody(
  BuildContext context, {
  required ToastType type,
  required String title,
  required String message,
}) {
  return Container(
    width: 370,
    height: context.heightUnit * 8,
    decoration: BoxDecoration(
        color: toastColorGetter(type),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox().widthSpacer(context, 3),
        Image.asset(
          toastIconGetter(type),
          scale: 6,
        ),
        const SizedBox().widthSpacer(context, 3),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(message),
            ],
          ),
        ),
        AnimatorButton(
            childToBeAnimated: Text(
              'X',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold, color: toastBarColorGetter(type)),
            ),
            onPressed: () {
              ToastManager().dismissAll(showAnim: true);
            }),
        const SizedBox().widthSpacer(context, 3)
      ],
    ),
  );
}

String toastIconGetter(ToastType type) {
  switch (type) {
    case ToastType.good:
      return AssetPaths.instance.GOOD;
    case ToastType.bad:
      return AssetPaths.instance.BAD;
    case ToastType.info:
      return AssetPaths.instance.INFO;
    default:
      return AssetPaths.instance.INFO;
  }
}

Color toastColorGetter(ToastType type) {
  switch (type) {
    case ToastType.good:
      return Palette.instance.TOASTGREENLIGHT;
    case ToastType.bad:
      return Palette.instance.TOASTREDLIGHT;
    case ToastType.info:
      return Palette.instance.TOASTBLUELIGHT;
    default:
      return Palette.instance.TOASTBLUELIGHT;
  }
}

Color toastBarColorGetter(ToastType type) {
  switch (type) {
    case ToastType.good:
      return Palette.instance.TOASTGREENDARK;
    case ToastType.bad:
      return Palette.instance.TOASTREDDARK;
    case ToastType.info:
      return Palette.instance.TOASTBLUEDARK;
    default:
      return Palette.instance.TOASTBLUEDARK;
  }
}
