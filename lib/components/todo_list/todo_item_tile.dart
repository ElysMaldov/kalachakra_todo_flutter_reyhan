import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/buttons/delete_todo_button.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/buttons/edit_todo_button.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_controller.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/todo.dart';
import 'package:kalachakra_todo_flutter_reyhan/themes/colors.dart';

class TodoItemTile extends StatelessWidget {
  final Todo todo;
  const TodoItemTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    final TodoController todoController = TodoController(todoCubit: todoCubit);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        todo.title,
        style: GoogleFonts.kanit(
          textStyle: Theme.of(context).textTheme.bodyLarge,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: todo.completed
              ? Color.fromRGBO(37, 37, 37, 0.5)
              : Theme.of(context).colorScheme.secondary,
          decoration: todo.completed
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      leading: Transform.scale(
        scale: 1.2,
        child: Checkbox(
          activeColor: Theme.of(context).colorScheme.tertiary,
          checkColor: primaryColor,
          side: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
            width: 1,
          ),
          value: todo.completed,
          onChanged: (_) async {
            await todoController.toggleTodo(todo);
            scaffoldMessenger.showSnackBar(
              SnackBar(content: Text('Todo toggled.')),
            );
          },
        ),
      ),
      trailing: SizedBox(
        // TODO fix width
        width: 80,
        child: Row(
          children: [
            // TODO use svg from figma for the icons
            EditTodoButton(todo: todo),
            DeleteTodoButton(todoId: todo.id),
          ],
        ),
      ),
    );
  }
}
