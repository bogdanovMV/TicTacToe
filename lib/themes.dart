import 'package:flutter/material.dart';
import 'colors.dart';

class ColorsShape {
  static const Color colorX = Color(0xFFF51414);
  static const Color colorO = Color(0xFF95E30B);
}

final kMainThemeLight = ThemeData(
  scaffoldBackgroundColor: lightPrimary,
  primaryColor: lightPrimary,
  appBarTheme: const AppBarTheme(
    color: lightAdditional,
    titleTextStyle: TextStyle(
        fontSize: 26, color: lightAccent, fontWeight: FontWeight.w900),
    foregroundColor: lightPrimary,
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
        color: lightAdditional, fontWeight: FontWeight.w900, fontSize: 20),
  ),
  toggleableActiveColor: lightPrimary,
);

final kMainThemeDark = ThemeData(
  scaffoldBackgroundColor: darkPrimary,
  primaryColor: darkPrimary,
  appBarTheme: const AppBarTheme(
    color: darkAdditional,
    titleTextStyle:
        TextStyle(fontSize: 26, color: darkAccent, fontWeight: FontWeight.w900),
    foregroundColor: darkPrimary,
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
        color: darkAdditional, fontWeight: FontWeight.w900, fontSize: 20),
  ),
  toggleableActiveColor: darkPrimary,
);
