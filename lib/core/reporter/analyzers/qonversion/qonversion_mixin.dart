import 'package:qonversion_flutter/qonversion_flutter.dart';

mixin QonversionMixin {
  Future<void> initQonversion() async {
    final QLaunchResult launchResult = await Qonversion.launch(
      'PV77YHL7qnGvsdmpTs7gimsxUvY-Znl2',
      isObserveMode: false,
    );
  }

  Future<void> qonversionsLogBottomBarEvent({required Map<String, dynamic> data}) async {}
}
