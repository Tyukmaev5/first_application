import 'package:flutter/material.dart';
import 'package:rhymer/ui/ui.dart';

final lightTheme = ThemeData(
  textTheme: textTheme,
  useMaterial3: true,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: const Color(0xFFEFF1F3),
  dividerTheme: DividerThemeData(
    color: Colors.grey.withOpacity(0.1),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  ),
);
