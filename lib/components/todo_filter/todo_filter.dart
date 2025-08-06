import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/buttons/primary_button.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/todo_filter/todo_filter_menu.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/enums/todo_status.dart';

class TodoFilter extends StatefulWidget {
  const TodoFilter({super.key});

  @override
  State<TodoFilter> createState() => _TodoFilterState();
}

class _TodoFilterState extends State<TodoFilter> {
  bool _showMenu = false;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodoCubit, TodoState, TodoStatus>(
      selector: (state) => state.filterTodoStatus,
      builder: (context, state) => Stack(
        clipBehavior: Clip.none,
        children: [
          PrimaryButton(
            onPressed: toggleMenu,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Row(
              spacing: 30,
              children: [
                Text(state.label.toUpperCase()),
                RotatedBox(quarterTurns: -1, child: Icon(Icons.chevron_left)),
              ],
            ),
          ),
          if (_showMenu)
            Transform.translate(offset: Offset(0, 36), child: TodoFilterMenu()),

          // Positioned(top: 38, left: 0, right: 0, child: TodoFilterMenu()),
        ],
      ),
    );
  }

  void toggleMenu() {
    setState(() {
      _showMenu = !_showMenu; // Toggle menu
    });
  }
}
