import 'package:amplitude_flutter/amplitude.dart';
import 'package:unirepo/core/reporter/event_keys.dart';
import 'package:unirepo/magic_box.dart';

mixin AmplitudeMixin {
  late final Amplitude analytics;

  Future<void> initAmplitude() async {
    analytics = Amplitude.getInstance(instanceName: MagicBox.shared.amplitudeProjectName);
    await analytics.init(MagicBox.shared.amplitudeID);
  }

  Future<void> amplitudeLogBottomBarEvent({required Map<String, dynamic> data}) async {
    await analytics.logEvent(
      EventKeys.shared.bottomNavigationBarButton,
      eventProperties: data,
    );
  }
}
