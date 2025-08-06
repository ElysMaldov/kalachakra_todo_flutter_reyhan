import 'package:flutter/material.dart';
import 'package:kalachakra_todo_flutter_reyhan/views/components/todo_filter/todo_filter_menu_item.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/enums/todo_status.dart';
import 'package:kalachakra_todo_flutter_reyhan/views/themes/colors.dart';

// FIXME not taking full width of the stack
class TodoFilterMenu extends StatelessWidget {
  const TodoFilterMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 100),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.4),
        child: Column(
          children: TodoStatus.values.map((status) {
            return TodoFilterMenuItem(status: status);
          }).toList(),
        ),
      ),
    );
  }
}
