import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:unirepo/magic_box.dart';

mixin QonversionMixin {
  Future<void> initQonversion() async {
    await Qonversion.launch(
      MagicBox.shared.qonversionProjectKey,
      isObserveMode: false,
    );
  }
}
