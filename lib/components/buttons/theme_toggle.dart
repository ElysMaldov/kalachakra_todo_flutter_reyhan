import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/buttons/primary_button.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 38,
      child: PrimaryButton(
        padding: EdgeInsets.all(8),
        onPressed: () => AdaptiveTheme.of(context).toggleThemeMode(),
        child: ValueListenableBuilder(
          valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
          builder: (_, mode, child) {
            if (mode == AdaptiveThemeMode.dark) {
              return Icon(Icons.light_mode_outlined, size: 22);
            }

            return Icon(Icons.dark_mode_outlined, size: 22);
          },
        ),
      ),
    );
  }
}
