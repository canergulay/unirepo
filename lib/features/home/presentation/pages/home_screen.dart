import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/features/home/presentation/widgets/search_bar.dart/search_bar.dart';
import 'package:unirepo/features/home/presentation/widgets/search_bar.dart/search_bar_provider.dart';
import 'package:unirepo/features/home/presentation/widgets/search_bar.dart/search_bar_stack.dart';
import 'package:unirepo/features/home/presentation/widgets/university_pickder.dart/university_picked_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBarProvider>(builder: (context, provider, widget) {
      return homePageChildGetter(context, provider);
    });
  }
}

Widget homePageChildGetter(BuildContext context, SearchBarProvider provider) {
  if (!provider.isUniversityPicked) {
    return const SearchBarStackWidget();
  } else {
    return const UniversityPicked();
  }
}
