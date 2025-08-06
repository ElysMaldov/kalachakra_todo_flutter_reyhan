import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyTodoList extends StatelessWidget {
  const EmptyTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        ValueListenableBuilder(
          valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
          builder: (_, mode, child) {
            if (mode == AdaptiveThemeMode.dark) {
              return Image(image: AssetImage("images/empty-todo-dark.png"));
            }

            return Image(image: AssetImage("images/empty-todo.png"));
          },
        ),
        Text(
          "Empty...",
          style: GoogleFonts.kanit(
            textStyle: Theme.of(context).textTheme.bodyMedium,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
