import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/themes/dark_theme.dart';
import 'package:kalachakra_todo_flutter_reyhan/themes/light_theme.dart';
import 'package:kalachakra_todo_flutter_reyhan/utils/router.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final TodoCubit todoBloc = TodoCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => todoBloc,
      child: AdaptiveTheme(
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
      ),
    );
  }
}
