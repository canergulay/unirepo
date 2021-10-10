import 'package:flutter/cupertino.dart';
import 'package:unirepo/core/components/toasts/toast_manager.dart';
import 'package:unirepo/core/utils/enums/toast_type_enum.dart';

import 'toast_widgets.dart/general_toast.dart';

void showErrorToast(
  BuildContext context, {
  required String title,
  required String message,
}) {
  ToastShower.instance.showMyToast(
      context,
      GeneralToast(
        title: title,
        message: message,
        type: ToastType.bad,
      ));
}

void showGeneralErrorToast(BuildContext context) {
  ToastShower.instance.showMyToast(
      context,
      GeneralToast(
        title: 'Hata !',
        message: 'Bilinmeyen bir hata oluştu, lütfen tekrar deneyin.',
        type: ToastType.bad,
      ));
}
