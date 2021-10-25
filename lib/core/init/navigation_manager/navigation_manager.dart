import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/constants/navigation_constants.dart';
import 'package:unirepo/features/note/data/models/note/note.dart';
import 'package:unirepo/features/landing/landing_screen.dart';
import 'package:unirepo/features/note/presentation/pages/note_screen.dart';
import 'package:unirepo/features/note/presentation/provider/note_page_provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final arg = settings.arguments;

    switch (settings.name) {
      case NavigationConstants.base:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case NavigationConstants.note:
        if (arg is Note) {
          return CupertinoPageRoute(
            builder: (_) => ChangeNotifierProvider(
              create: (context) => NotesPageViewProvider(),
              child: NoteScreen(
                note: arg,
              ),
            ),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
