import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_controller.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';

class DeleteTodoButton extends StatelessWidget {
  final int todoId;

  const DeleteTodoButton({super.key, required this.todoId});

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    final TodoController todoController = TodoController(todoCubit: todoCubit);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return IconButton(
      onPressed: () async {
        await todoController.deleteTodo(todoId);
        scaffoldMessenger.showSnackBar(
          SnackBar(content: Text('Todo deleted.')),
        );
      },
      icon: Icon(Icons.delete_outline),
    );
  }
}
