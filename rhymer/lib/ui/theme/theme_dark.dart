import 'package:flutter/material.dart';
import 'package:rhymer/ui/ui.dart';

final darkTheme = ThemeData(
  textTheme: textTheme,
  useMaterial3: true,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.black,
  dividerTheme: DividerThemeData(
    color: Colors.grey.withOpacity(0.1),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
  ),
);
