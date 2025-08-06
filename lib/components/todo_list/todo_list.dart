import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/todo_list/todo_item_tile.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_controller.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/models/todo.dart' as todoTypes;

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
    // Initialize
    final todoCubit = context.read<TodoCubit>();
    final TodoController todoController = TodoController(todoCubit: todoCubit);
    todoController.loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodoCubit, TodoState, todoTypes.TodoList>(
      selector: (state) {
        final todoCubit = context.read<TodoCubit>();
        return todoCubit.filteredTodos;
      },
      builder: (context, state) => Container(
        constraints: BoxConstraints(minWidth: 360, maxWidth: 750),
        width: 750,
        padding: EdgeInsets.only(top: 30, left: 115, right: 115),
        height: 500,
        child: ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            return TodoItemTile(todo: state[index]);
          },
        ),
      ),
    );
  }
}
