import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_controller.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/views/themes/colors.dart';

class DeleteTodoButton extends StatefulWidget {
  final int todoId;

  const DeleteTodoButton({super.key, required this.todoId});

  @override
  State<DeleteTodoButton> createState() => _DeleteTodoButtonState();
}

class _DeleteTodoButtonState extends State<DeleteTodoButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    final TodoController todoController = TodoController(todoCubit: todoCubit);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () async {
          await todoController.deleteTodo(widget.todoId);
          scaffoldMessenger.showSnackBar(
            SnackBar(content: Text('Todo deleted.')),
          );
        },
        icon: Icon(
          Icons.delete_outline,
          color: isHovered
              ? Theme.of(context).colorScheme.error
              : deactivatedIcon,
        ),
      ),
    );
  }
}
