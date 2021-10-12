import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unirepo/core/components/buttons/animator_button.dart';
import 'package:unirepo/core/constants/asset_paths.dart';
import 'package:unirepo/core/reporter/report_manager.dart';
import 'package:unirepo/features/landing/widgets/bottom_navigation_bar/bototm_navigation_provider.dart';

Expanded userButton(BuildContext context, int index) {
  return Expanded(
    child: animatorButton(context, index),
  );
}

Expanded homeButton(BuildContext context, int index) {
  return Expanded(
    child: animatorButton(context, index),
  );
}

AnimatorButton animatorButton(BuildContext context, int index) {
  return AnimatorButton(
    isOnPressedBeforeAnimation: true,
    onPressed: () {
      context.read<BottomNavigationProvider>().changePage(index);
    },
    upperBound: 0.4,
    childToBeAnimated: Image.asset(
      bottomNavBarIconGetter(index),
      color: colorGetter(context, index),
      scale: 15,
    ),
  );
}

String bottomNavBarIconGetter(int index) {
  switch (index) {
    case 0:
      return AssetPaths.instance.home;
    case 1:
      return AssetPaths.instance.user;
    default:
      return AssetPaths.instance.home;
  }
}

Color? colorGetter(BuildContext context, int index) {
  return context.read<BottomNavigationProvider>().bottomNavigationState == index
      ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
      : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;
}
