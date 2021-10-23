import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/auth/login/login_provider.dart';
import 'package:unirepo/core/auth/manager/authentication_provider.dart';
import 'package:unirepo/core/auth/register/register_provider.dart';
import 'package:unirepo/core/init/injection/get_them_all.dart';
import 'package:unirepo/features/home/domain/usecases/get_notes.dart';
import 'package:unirepo/features/home/domain/usecases/get_supported_prefices.dart';
import 'package:unirepo/features/home/presentation/widgets/search_bar.dart/search_bar_provider.dart';
import 'package:unirepo/features/landing/widgets/bottom_navigation_bar/bottom_navigation_provider.dart';

class MainProviders {
  static MultiProvider get({required Widget child}) => MultiProvider(
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
          ),
          Provider(
            create: (context) => RegisterManager(
              authenticationProvider: context.read<AuthenticationProvider>(),
            ),
          ),
          Provider(
              create: (context) => LoginManager(
                    authenticationProvider: context.read<AuthenticationProvider>(),
                  )),
        ],
        child: child,
      );
}
