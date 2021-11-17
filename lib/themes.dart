import 'package:flutter/material.dart';

final kMainTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.orange,
  appBarTheme: kMainAppBarTheme,
);

final kMainAppBarTheme = const AppBarTheme().copyWith(
  color: Colors.orangeAccent,
  centerTitle: true,
);