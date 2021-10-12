import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:unirepo/core/reporter/event_keys.dart';
import 'package:unirepo/magic_box.dart';

mixin AppsFlyerMixin {
  late final AppsflyerSdk appsFlyerSdk;

  Future<void> initAppsFlier() async {
    Map<String, dynamic> appsFlyerOptions = {
      "afDevKey": MagicBox.shared.appsflyerDevKey,
      "afAppId": MagicBox.shared.appsflyerAppId,
    };

    appsFlyerSdk = AppsflyerSdk(appsFlyerOptions);
    final response = await appsFlyerSdk.initSdk();
  }

  Future<void> appsFlyerLogBottomBarEvent({required Map<String, dynamic> data}) async {
    final bool? result = await appsFlyerSdk.logEvent(
      EventKeys.shared.bottomNavigationBarButton,
      data,
    );
  }
}
