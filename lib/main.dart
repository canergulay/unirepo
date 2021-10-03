import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/init/injection/get_them_all.dart' as getItStarter;
import 'core/theme/app_theme.dart';
import 'features/home/data/models/university.dart';
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
    return MaterialApp(theme: ThemeManager.create(AppThemeLight()), title: 'Material App', home: const LandingScreen());
  }
}
