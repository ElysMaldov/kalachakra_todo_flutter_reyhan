import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:kalachakra_todo_flutter_reyhan/themes/dark_theme.dart';
import 'package:kalachakra_todo_flutter_reyhan/themes/light_theme.dart';
import 'package:kalachakra_todo_flutter_reyhan/utils/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp.router(
        title: 'Kalachakra To Do Reyhan',
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
