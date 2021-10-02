import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/components/buttons/animator_button.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/features/landing/widgets/bottom_navigation_bar/bototm_navigation_provider.dart';

import 'bottom_navigation_bar_utils.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(color: Theme.of(context).bottomNavigationBarTheme.backgroundColor, boxShadow: const [BoxShadow()]),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          homeButton(context, 0),
          userButton(context, 1),
        ],
      ),
    );
  }
}
