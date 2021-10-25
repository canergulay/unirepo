import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:unirepo/core/constants/app_constants.dart';
import 'package:unirepo/core/constants/navigation_constants.dart';
import 'package:unirepo/core/init/navigation_manager/navigation_manager.dart';
import 'package:unirepo/core/local_manager/hive_manager.dart';

import 'core/init/injection/get_them_all.dart' as getItStarter;
import 'core/theme/app_theme.dart';
import 'features/home/data/models/university/university.dart';
import 'features/landing/landing_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getItStarter.setUp();
  await Hive.initFlutter();
  Hive.registerAdapter(UniversityAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.create(AppThemeLight()),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: NavigationConstants.base,
    );
  }
}
