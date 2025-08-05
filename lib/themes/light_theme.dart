import 'package:flutter/material.dart';
import 'package:kalachakra_todo_flutter_reyhan/themes/colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: secondaryColor,
    secondary: secondaryColor,
    onSecondary: primaryColor,
    error: errorColor,
    onError: primaryColor,
    tertiary: accentColor,
    onTertiary: primaryColor,
    surface: primaryColor,
    onSurface: secondaryColor,
  ),
);
