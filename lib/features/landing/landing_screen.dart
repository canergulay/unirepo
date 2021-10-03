import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/features/home/presentation/pages/home_screen.dart';
import 'package:unirepo/features/home/presentation/widgets/search_bar.dart/search_bar_provider.dart';
import 'package:unirepo/features/landing/screens.dart';
import 'package:unirepo/features/landing/widgets/bottom_navigation_bar/bototm_navigation_provider.dart';
import 'package:unirepo/features/landing/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchBarProvider>(create: (_) => SearchBarProvider()),
        ChangeNotifierProvider<BottomNavigationProvider>(create: (_) => BottomNavigationProvider())
      ],
      child: Consumer<BottomNavigationProvider>(builder: (context, provider, w) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(),
          body: AppScreens.call()[provider.bottomNavigationState],
        );
      }),
    );
  }
}
