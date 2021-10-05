import 'package:flutter/material.dart';
import 'package:unirepo/features/home/presentation/widgets/search_bar.dart/search_bar.dart';

class SearchBarStackWidget extends StatelessWidget {
  const SearchBarStackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [SearchBar()],
    );
  }
}
