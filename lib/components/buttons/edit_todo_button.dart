import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/dialogs/todo_dialog.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_controller.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/todo.dart';

class EditTodoButton extends StatelessWidget {
  final Todo todo;
  final TextEditingController _controller = TextEditingController();

  EditTodoButton({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    final TodoController todoController = TodoController(todoCubit: todoCubit);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            _controller.text = todo.title;

            return TodoDialog(
              title: "EDIT NOTE",
              controller: _controller,
              hintText: "Input your note...",
              onPressed: (title) async {
                await todoController.updateTodo(todo.copyWith(title: title));
                scaffoldMessenger.showSnackBar(
                  SnackBar(content: Text('Todo edited.')),
                );
              },
            );
          },
        );
      },
      icon: Icon(Icons.edit_outlined),
    );
  }
}
