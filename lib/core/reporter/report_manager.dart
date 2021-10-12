import 'package:amplitude_flutter/amplitude.dart';
import 'package:unirepo/core/reporter/analyzers/amplitude/amplitude_mixin.dart';
import 'package:unirepo/core/reporter/analyzers/appsflyer/appsflyer.dart';
import 'package:unirepo/core/reporter/analyzers/qonversion/qonversion_mixin.dart';
import 'package:unirepo/magic_box.dart';

class ReportManager with AmplitudeMixin, QonversionMixin, AppsFlyerMixin {
  static ReportManager _instace = ReportManager._init();
  static ReportManager get instance => _instace;

  ReportManager._init();

  Future<void> initAnalyzers() async {
    await initAmplitude();
    await initQonversion();
    await initAppsFlier();
  }
  //GENERAL STUFF WILL BE HERE, FUNCTIONALITIES THAT WOULD AFFECT ALL THE ANALYZERS.

  Future<void> logBottomNavbarEventCollective({
    required Map<String, dynamic> data,
  }) async {
    // LOGS FOR BOTH THE SERVICES IN ONE TRANSACTION

    // WE CAN ALSO USE THEM SEPERATELY, SINCE THEY ARE LOCATED IN MIXINS WITHIN THIS CLASS.
    await amplitudeLogBottomBarEvent(data: data);
    await appsFlyerLogBottomBarEvent(data: data);
  }
}
