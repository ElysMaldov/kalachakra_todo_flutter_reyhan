import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/dialogs/todo_dialog.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_controller.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/themes/colors.dart';

/// When clicked, renders an add todo dialog with connection to TodoController
class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    final TodoController todoController = TodoController(todoCubit: todoCubit);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // TODO fix padding and width and add dropshadow
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        elevation: 1,
        minimumSize: Size(50, 50),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return TodoDialog(
              title: "NEW NOTE",
              hintText: "Input your note...",
              controller: TextEditingController(),
              onPressed: (title) async {
                await todoController.addTodo(title);
                scaffoldMessenger.showSnackBar(
                  SnackBar(content: Text('Todo added.')),
                );
              },
            );
          },
        );
      },

      // padding: EdgeInsets.zero,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      // child: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: const Icon(Icons.add, size: 24),
      // ),
      // color: Theme.of(context).colorScheme.tertiary,
      child: Icon(Icons.add, size: 24, color: primaryColor),
    );
  }
}
