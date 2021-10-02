import 'package:flutter/material.dart';
import 'package:unirepo/core/theme/color_manager.dart';
import 'package:unirepo/core/theme/light/text/light_text.dart';
import 'package:unirepo/core/theme/text_teheme.dart';

abstract class ITheme {
  ITextTheme get textTheme;
  IColors get colors;
}

abstract class ThemeManager {
  static ThemeData create(ITheme theme) => ThemeData(
      fontFamily: theme.textTheme.fontFamily,
      textTheme: theme.textTheme.data,
      cardColor: theme.colors.colorScheme?.onSecondary,
      bottomAppBarColor: theme.colors.scaffoldBackgroundColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: theme.colors.bottomNavBarBackGround,
          selectedItemColor: theme.colors.bottomNavBarSelected,
          unselectedItemColor: theme.colors.bottomNavBarUnSelected),
      tabBarTheme: TabBarTheme(
        indicator: const BoxDecoration(),
        labelColor: theme.colors.tabbarSelectedColor,
        unselectedLabelColor: theme.colors.tabbarNormalColor,
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(foregroundColor: theme.colors.colors.white, backgroundColor: theme.colors.colors.mediumGreyBold),
      appBarTheme: AppBarTheme(backgroundColor: theme.colors.appBarColor),
      scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
      colorScheme: theme.colors.colorScheme);
}

class AppThemeLight extends ITheme {
  @override
  late final ITextTheme textTheme;

  AppThemeLight() {
    textTheme = TextThemeLight(colors.colors.mediumGrey);
  }

  @override
  IColors get colors => LightColors();
}
