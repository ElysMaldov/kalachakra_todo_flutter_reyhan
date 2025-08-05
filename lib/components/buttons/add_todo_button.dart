import 'package:flutter/material.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/buttons/primary_button.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/dialogs/todo_dialog.dart';

/// When clicked, renders an add todo dialog with connection to TodoController
class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO fix padding and width and add dropshadow
    return PrimaryButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return TodoDialog(
              title: "NEW NOTE",
              hintText: "Input your note...",
              onPressed: (p0) {
                print(p0);
              },
            );
          },
        );
      },
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Icon(Icons.add, size: 24),
      ),
    );
  }
}
