import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ToastManager {
  static ToastManager _instace = ToastManager._init();
  static ToastManager get instance => _instace;
  ToastManager._init();

  void showErrorToast(BuildContext context, {required String message}) {
    _toaster(
      context,
      text: message,
      backgroundColor: Theme.of(context).colorScheme.onError,
    );
  }

  void _toaster(BuildContext context, {required Color backgroundColor, required String text}) {
    showToast(
      text,
      textStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
      context: context,
      backgroundColor: backgroundColor,
      alignment: Alignment.topCenter,
      position: StyledToastPosition.center,
      animation: StyledToastAnimation.slideFromBottom,
    );
  }
}
