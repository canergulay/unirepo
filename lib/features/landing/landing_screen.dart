import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/auth/manager/authentication_provider.dart';
import 'package:unirepo/core/init/injection/get_them_all.dart';
import 'package:unirepo/features/home/domain/usecases/get_notes.dart';
import 'package:unirepo/features/home/domain/usecases/get_supported_prefices.dart';
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
        ChangeNotifierProvider<SearchBarProvider>(
            create: (_) => SearchBarProvider(
                  getSupportedPrefices: injector.get<GetSupportedPrefices>(),
                  getNotes: injector.get<GetNotes>(),
                )),
        ChangeNotifierProvider<BottomNavigationProvider>(
          create: (_) => BottomNavigationProvider(),
        ),
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(),
        )
      ],
      child: Consumer<BottomNavigationProvider>(builder: (context, provider, w) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(),
          body: AppScreens.screens()[provider.bottomNavigationState],
        );
      }),
    );
  }
}
