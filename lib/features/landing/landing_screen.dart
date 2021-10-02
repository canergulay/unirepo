import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/constants/palette.dart';
import 'package:unirepo/features/landing/widgets/appbar.dart';
import 'package:unirepo/features/landing/widgets/bottom_navigation_bar/bototm_navigation_provider.dart';
import 'package:unirepo/features/landing/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavigationProvider>(
      create: (context) => BottomNavigationProvider(),
      child: Consumer<BottomNavigationProvider>(builder: (context, provider, w) {
        return Scaffold(
          appBar: appBar(),
          bottomNavigationBar: CustomBottomNavigationBar(),
          body: Column(
            children: [],
          ),
        );
      }),
    );
  }
}
