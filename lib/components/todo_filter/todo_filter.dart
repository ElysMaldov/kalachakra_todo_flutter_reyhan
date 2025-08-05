import 'package:flutter/material.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/buttons/primary_button.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/todo_filter/todo_filter_menu.dart';

class TodoFilter extends StatefulWidget {
  const TodoFilter({super.key});

  @override
  State<TodoFilter> createState() => _TodoFilterState();
}

class _TodoFilterState extends State<TodoFilter> {
  bool _showMenu = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PrimaryButton(
          onPressed: toggleMenu,
          padding: EdgeInsets.all(10),
          child: Row(
            spacing: 30,
            children: [
              Text("ALL"),
              RotatedBox(quarterTurns: -1, child: Icon(Icons.chevron_left)),
            ],
          ),
        ),
        if (_showMenu)
          Positioned(top: 32, left: 0, right: 0, child: TodoFilterMenu()),
      ],
    );
  }

  void toggleMenu() {
    setState(() {
      _showMenu = !_showMenu; // Toggle menu
    });
  }
}
