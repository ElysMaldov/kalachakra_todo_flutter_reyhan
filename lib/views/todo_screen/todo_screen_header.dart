import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/buttons/theme_toggle.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/inputs/todo_search_input.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/todo_filter/todo_filter.dart';

class TodoScreenHeader extends StatefulWidget {
  const TodoScreenHeader({super.key});

  @override
  State<TodoScreenHeader> createState() => _TodoScreenHeaderState();
}

class _TodoScreenHeaderState extends State<TodoScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            spacing: 18,
            children: [
              Text(
                "TODO LIST",
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.headlineLarge,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),

              SizedBox(
                width: 750,
                child: Row(
                  spacing: 16,
                  children: [
                    Expanded(child: TodoSearchInput()),
                    TodoFilter(),
                    ThemeToggle(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
