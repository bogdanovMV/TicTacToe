import 'package:flutter/material.dart';

final kMainThemeLight = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.orangeAccent,
  appBarTheme: _kMainLightAppBarTheme,
  textTheme: _kMainLightTextTheme,
);

final _kMainLightAppBarTheme = const AppBarTheme().copyWith(
  color: Colors.orange,
  titleTextStyle: const TextStyle(
      fontSize: 40, color: Colors.white70, fontWeight: FontWeight.w900),
  actionsIconTheme: const IconThemeData(color: Colors.orangeAccent),
  centerTitle: true,
);

final _kMainLightTextTheme = const TextTheme().copyWith(
    bodyText2: const TextStyle(
        color: Colors.white70, fontWeight: FontWeight.w900, fontSize: 20));

final kMainThemeDark = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.deepPurpleAccent,
  appBarTheme: _kMainDarkAppBarTheme,
  textTheme: _kMainDarkTextTheme,
);

final _kMainDarkAppBarTheme = const AppBarTheme().copyWith(
  color: Colors.deepPurple,
  titleTextStyle: const TextStyle(
      fontSize: 40, color: Colors.purple, fontWeight: FontWeight.w900),
  actionsIconTheme: const IconThemeData(color: Colors.deepPurpleAccent),
  centerTitle: true,
);

final _kMainDarkTextTheme = const TextTheme().copyWith(
    bodyText2: const TextStyle(
        color: Colors.purple, fontWeight: FontWeight.w900, fontSize: 20));
