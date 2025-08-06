import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/buttons/edit_todo_button.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_controller.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/todo.dart';

class TodoItemTile extends StatelessWidget {
  final Todo todo;
  const TodoItemTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    final TodoController todoController = TodoController(todoCubit: todoCubit);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return ListTile(
      title: Text(
        todo.title,
        style: GoogleFonts.kanit(
          textStyle: Theme.of(context).textTheme.bodyLarge,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      leading: Checkbox(
        value: todo.completed,
        onChanged: (_) async {
          await todoController.toggleTodo(todo);
          scaffoldMessenger.showSnackBar(
            SnackBar(content: Text('Todo toggled.')),
          );
        },
      ),
      trailing: SizedBox(
        // TODO fix width
        width: 80,
        child: Row(
          children: [
            // TODO use svg from figma for the icons
            EditTodoButton(todo: todo),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline)),
          ],
        ),
      ),
    );
  }
}
