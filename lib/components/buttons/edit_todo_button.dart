import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/dialogs/todo_dialog.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_controller.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/todo.dart';
import 'package:kalachakra_todo_flutter_reyhan/themes/colors.dart';

class EditTodoButton extends StatefulWidget {
  final Todo todo;

  const EditTodoButton({super.key, required this.todo});

  @override
  State<EditTodoButton> createState() => _EditTodoButtonState();
}

class _EditTodoButtonState extends State<EditTodoButton> {
  bool isHovered = false;
  final TextEditingController _controller = TextEditingController();

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
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              _controller.text = widget.todo.title;

              return TodoDialog(
                title: "EDIT NOTE",
                controller: _controller,
                hintText: "Input your note...",
                onPressed: (title) async {
                  await todoController.updateTodo(
                    widget.todo.copyWith(title: title),
                  );
                  scaffoldMessenger.showSnackBar(
                    SnackBar(content: Text('Todo edited.')),
                  );
                },
              );
            },
          );
        },
        icon: Icon(
          Icons.edit_outlined,
          color: isHovered
              ? Theme.of(context).colorScheme.tertiary
              : deactivatedIcon,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
