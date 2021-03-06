part of '../../color_manager.dart';

class LightColors implements IColors {
  @override
  final _AppColors colors = _AppColors();

  @override
  ColorScheme? colorScheme;
  @override
  Color? appBarColor;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? tabBarColor;

  @override
  Color? tabbarNormalColor;

  @override
  Color? tabbarSelectedColor;

  LightColors() {
    appBarColor = const Color(0xFF66ABFE);
    scaffoldBackgroundColor = const Color(0xFFededed);
    tabBarColor = colors.green;
    tabbarNormalColor = colors.darkerGrey;
    tabbarSelectedColor = colors.green;

    bottomNavBarBackGround = Colors.white;
    bottomNavBarSelected = const Color(0xFF4a4a4a);
    bottomNavBarUnSelected = const Color(0xFFdbdbdb);
    colorScheme = const ColorScheme.light().copyWith(
      primary: Colors.white,
      onPrimary: const Color(0xFF5A6988),
      onSecondary: colors.white,
      onError: Color(0xFFcc0000),
      secondary: const Color(0xFFCACBCE),
      secondaryVariant: const Color(0xFF01a7ef),
      primaryVariant: const Color(0xFF25c5fa),
      onSurface: colors.mediumGreyBold,
    );
    brightness = Brightness.light;
  }

  @override
  Brightness? brightness;

  @override
  Color? bottomNavBarBackGround;

  @override
  Color? bottomNavBarSelected;

  @override
  Color? bottomNavBarUnSelected;
}
