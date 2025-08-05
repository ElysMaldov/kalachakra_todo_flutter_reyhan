import 'package:flutter/material.dart';
import 'package:kalachakra_todo_flutter_reyhan/themes/colors.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: secondaryColor,
    onPrimary: primaryColor,
    secondary: primaryColor,
    onSecondary: secondaryColor,
    error: errorColor,
    onError: primaryColor,
    tertiary: accentColor,
    onTertiary: primaryColor,
    surface: secondaryColor,
    onSurface: primaryColor,
  ),
);
