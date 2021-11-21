import 'package:flutter/material.dart';

const Color _lightAdditional = Color(0xffff5c07);
const Color _lightAccent = Color(0xffffedb0);
const Color _lightPrimary = Color(0xffffe646);


final kMainThemeLight = ThemeData.light().copyWith(
  scaffoldBackgroundColor: _lightPrimary,
  appBarTheme: _kMainLightAppBarTheme,
  textTheme: _kMainLightTextTheme,
);

final _kMainLightAppBarTheme = const AppBarTheme().copyWith(
  color: _lightAdditional,
  titleTextStyle: const TextStyle(
      fontSize: 26, color: _lightAccent, fontWeight: FontWeight.w900),
  actionsIconTheme: const IconThemeData(color: _lightAccent),
  centerTitle: true,
);

final _kMainLightTextTheme = const TextTheme().copyWith(
    bodyText2: const TextStyle(
        color: _lightAdditional, fontWeight: FontWeight.w900, fontSize: 20));

const Color _darkAdditional = Color(0xff5a24b4);
const Color _darkAccent = Color(0xfffe00ea);
const Color _darkPrimary = Color(0xffaa00ff);

final kMainThemeDark = ThemeData.light().copyWith(
  scaffoldBackgroundColor: _darkPrimary,
  appBarTheme: _kMainDarkAppBarTheme,
  textTheme: _kMainDarkTextTheme,
);

final _kMainDarkAppBarTheme = const AppBarTheme().copyWith(
  color: _darkAdditional,
  titleTextStyle: const TextStyle(
      fontSize: 26, color: _darkAccent, fontWeight: FontWeight.w900),
  actionsIconTheme: const IconThemeData(color: _darkAccent),
  centerTitle: true,
);

final _kMainDarkTextTheme = const TextTheme().copyWith(
    bodyText2: const TextStyle(
        color: _darkAdditional, fontWeight: FontWeight.w900, fontSize: 20));
